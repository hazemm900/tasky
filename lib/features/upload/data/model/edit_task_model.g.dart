// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTaskModel _$EditTaskModelFromJson(Map<String, dynamic> json) =>
    EditTaskModel(
      json['image'] as String,
      json['title'] as String,
      json['desc'] as String,
      json['priority'] as String,
      json['status'] as String,
      json['user'] as String,
    );

Map<String, dynamic> _$EditTaskModelToJson(EditTaskModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'status': instance.status,
      'user': instance.user,
    };
