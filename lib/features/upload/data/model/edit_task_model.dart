import 'package:json_annotation/json_annotation.dart';

part 'edit_task_model.g.dart';

@JsonSerializable()
class EditTaskModel {
  final String image;

  final String title;

  final String desc;

  final String priority;

  final String status;

  final String user;

  EditTaskModel(this.image, this.title, this.desc, this.priority, this.status, this.user);

  Map<String, dynamic> toJson() => _$EditTaskModelToJson(this);
}
