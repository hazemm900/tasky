// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegisterRequestModel(
      json['phone'] as String,
      json['password'] as String,
      json['displayName'] as String,
      json['experienceYears'] as String,
      json['address'] as String,
      json['level'] as String,
    );

Map<String, dynamic> _$RegisterRequestModelToJson(
        RegisterRequestModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
      'displayName': instance.displayName,
      'experienceYears': instance.experienceYears,
      'address': instance.address,
      'level': instance.level,
    };
