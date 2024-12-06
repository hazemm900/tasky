import 'package:tasky/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:tasky/features/auth/data/model/profile_model.dart';
import 'package:tasky/features/auth/data/model/token_model.dart';
import '../model/auth_model.dart';
import '../model/login_request_model.dart';
import '../model/register_request_model.dart';
import 'auth_const.dart';

part 'api_auth.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AuthWebServices {
  factory AuthWebServices(Dio dio, {String? baseUrl}) = _AuthWebServices;

  @POST(AuthConst.registerEndPoint)
  Future<AuthModel> register(@Body() RegisterRequestModel registerRequestModel);

  @POST(AuthConst.loginEndPoint)
  Future<AuthModel> login(@Body() LoginRequestModel loginRequestModel);

  @POST(AuthConst.logOutEndPoint)
  Future<dynamic> logOut(@Body() TokenModel tokenModel);

  @GET(AuthConst.profileEndPoint)
  Future<ProfileModel> profile();


}
