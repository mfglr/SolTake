import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'update_user_name_response.g.dart';

@immutable
@JsonSerializable()
class UpdateUserNameResponse {
  final String accessToken;
  final String refreshToken;
  
  factory UpdateUserNameResponse.fromJson(Map<String, dynamic> json) => _$UpdateUserNameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserNameResponseToJson(this);

  const UpdateUserNameResponse({required this.accessToken, required this.refreshToken});
}