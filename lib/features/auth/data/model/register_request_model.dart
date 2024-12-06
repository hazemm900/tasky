import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  final String phone;

  final String password;

  final String displayName;

  final String experienceYears;

  final String address;

  final String level;

  RegisterRequestModel(this.phone, this.password, this.displayName,
      this.experienceYears, this.address, this.level);

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
