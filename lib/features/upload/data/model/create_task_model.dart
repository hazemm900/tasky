import 'package:json_annotation/json_annotation.dart';

part 'create_task_model.g.dart';

@JsonSerializable()
class CreateTaskModel {
  final String image;

  final String title;

  final String desc;

  final String priority;

  final String dueDate;

  CreateTaskModel(
      this.image, this.title, this.desc, this.priority, this.dueDate);

  Map<String, dynamic> toJson() => _$CreateTaskModelToJson(this);
}
