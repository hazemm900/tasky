import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/auth/data/model/login_request_model.dart';
import 'package:tasky/features/auth/data/model/profile_model.dart';
import 'package:tasky/features/auth/data/model/register_request_model.dart';
import 'package:tasky/features/auth/data/model/token_model.dart';
import 'package:tasky/features/auth/data/repo/auth_repo.dart';
import 'package:tasky/features/auth/screens/log_in_screen.dart';
import 'package:tasky/features/auth/screens/home_screen.dart';
import 'package:tasky/features/upload/screens/list_screen.dart';
import '../../../core/helper/shared_preference.dart';
import '../../../core/networking/dio_factory.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  final AuthRepo _authRepo;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController experienceYearsController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController levelController = TextEditingController();

  void login(context) async {
    final result = await _authRepo.login(
        LoginRequestModel(phoneController.text, passwordController.text));
    result.when(success: (response) {
      saveToken(response.accessToken!, response.refreshToken!);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      profile();
      emit(RegisterSuccessState());
    }, failure: (error) {
      emit(RegisterFailedState(error));
    });
  }

  void register(context) async {
    final result = await _authRepo.register(RegisterRequestModel(
        phoneController.text,
        passwordController.text,
        nameController.text,
        experienceYearsController.text,
        addressController.text,
        levelController.text));
    result.when(success: (response) {
      saveToken(response.accessToken!, response.refreshToken!);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      // profilee();
      emit(RegisterSuccessState());
    }, failure: (error) {
      emit(RegisterFailedState(error));
    });
  }

  void saveToken(String token, String refreshToken) {
    // setTokenIntoHeaderAfterLogin(token);
    // DioFactory dioFactory = DioFactory() ;

    CacheHelper.saveData(key: "token", value: token);
    CacheHelper.saveData(key: "refreshToken", value: refreshToken);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  ProfileModel? profileModel;

  void profile() async {
    final result = await _authRepo.profile();
    result.when(success: (response) {
      profileModel = response;
      emit(RegisterProfileState());
    }, failure: (error) {
      emit(RegisterFailedState(error));
    });
  }

  void logOut(context) async {
    final result = await _authRepo
        .logOut(TokenModel(token: CacheHelper.getData(key: "token")));
    result.when(success: (response) {
      CacheHelper.removeData(key: "token");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      profile();
      emit(RegisterLogOutState());
    }, failure: (error) {
      emit(RegisterFailedState(error));
    });
  }
}
