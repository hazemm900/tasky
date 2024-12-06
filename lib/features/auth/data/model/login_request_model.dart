import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  final String phone;

  final String password;

  LoginRequestModel(this.phone, this.password);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
