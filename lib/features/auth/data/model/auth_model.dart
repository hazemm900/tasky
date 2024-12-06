import 'package:json_annotation/json_annotation.dart';
part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  String? sId;
  String? displayName;
  @JsonKey(name:"access_token")
  String? accessToken;
  @JsonKey(name: "refresh_token")
  String? refreshToken;

  AuthModel({this.sId, this.displayName, this.accessToken, this.refreshToken});

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

}
