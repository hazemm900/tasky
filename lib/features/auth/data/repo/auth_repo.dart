import 'package:tasky/features/auth/data/model/auth_model.dart';
import 'package:tasky/features/auth/data/model/login_request_model.dart';
import 'package:tasky/features/auth/data/model/profile_model.dart';
import 'package:tasky/features/auth/data/model/register_request_model.dart';
import 'package:tasky/features/auth/data/model/token_model.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/api_auth.dart';

class AuthRepo {
  final AuthWebServices _authWebServices;

  AuthRepo(this._authWebServices);

  Future<ApiResult<AuthModel>> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      final response = await _authWebServices.register(registerRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AuthModel>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await _authWebServices.login(loginRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProfileModel>> profile() async {
    try {
      final response = await _authWebServices.profile();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> logOut(TokenModel tokenModel) async {
    try {
      final response = await _authWebServices.logOut(tokenModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
