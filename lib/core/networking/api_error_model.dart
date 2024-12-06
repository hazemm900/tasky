// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// import '../helpers/extensions.dart';
//
//
// @JsonSerializable()
// class ApiErrorModel {
//   final String? message;
//   final Map<String, dynamic>? errors;
//
//   ApiErrorModel({
//     this.message,
//     this.errors,
//   });
//

//
//   Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
//
//   /// Returns a String containing all error messages.
//   String getAllErrorMessages() {
//     if (errors.isNullOrEmpty()) return message ?? "Unknown error occurred";
//
//     final errorMessages = errors!.entries.map((entry) {
//       final value = entry.value;
//       return "${value.join(', ')}";
//     }).join('\n');
//
//     return errorMessages;
//   }
// }
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  String? message;
  String? error;
  int? statusCode;

  ApiErrorModel({this.message, this.error, this.statusCode});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}
