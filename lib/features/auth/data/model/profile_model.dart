import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  String? sId;
  String? displayName;
  String? username;
  List<String>? roles;
  bool? active;
  int? experienceYears;
  String? address;
  String? level;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProfileModel(
      {this.sId,
        this.displayName,
        this.username,
        this.roles,
        this.active,
        this.experienceYears,
        this.address,
        this.level,
        this.createdAt,
        this.updatedAt,
        this.iV});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);


}
