import 'package:json_annotation/json_annotation.dart';
part 'token_model.g.dart';

@JsonSerializable()
class TokenModel{

final String token;

TokenModel({required this.token});

Map<String, dynamic> toJson() => _$TokenModelToJson(this);

}
