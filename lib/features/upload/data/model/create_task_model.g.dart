// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTaskModel _$CreateTaskModelFromJson(Map<String, dynamic> json) =>
    CreateTaskModel(
      json['image'] as String,
      json['title'] as String,
      json['desc'] as String,
      json['priority'] as String,
      json['dueDate'] as String,
    );

Map<String, dynamic> _$CreateTaskModelToJson(CreateTaskModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'dueDate': instance.dueDate,
    };
