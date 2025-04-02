import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'update_name_response.g.dart';

@immutable
@JsonSerializable()
class UpdateNameResponse {
  final String accessToken;
  final String refreshToken;
  
  factory UpdateNameResponse.fromJson(Map<String, dynamic> json) => _$UpdateNameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateNameResponseToJson(this);

  const UpdateNameResponse({required this.accessToken, required this.refreshToken});
}