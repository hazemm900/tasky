import 'package:tasky/core/networking/api_error_model.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterLogOutState extends AuthState {}

final class RegisterProfileState extends AuthState {}

final class RegisterFailedState extends AuthState {
  final ApiErrorModel apiErrorModel;

  RegisterFailedState(this.apiErrorModel);
}
