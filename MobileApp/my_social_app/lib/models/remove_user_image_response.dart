import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remove_user_image_response.g.dart';

@immutable
@JsonSerializable()
class RemoveUserImageResponse {
  final String accessToken;
  final String refreshToken;

  factory RemoveUserImageResponse.fromJson(Map<String, dynamic> json) => _$RemoveUserImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RemoveUserImageResponseToJson(this);

  const RemoveUserImageResponse({required this.accessToken, required this.refreshToken});

}
