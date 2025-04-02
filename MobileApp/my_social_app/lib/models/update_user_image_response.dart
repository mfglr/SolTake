import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
part 'update_user_image_response.g.dart';

@immutable
@JsonSerializable()
class UpdateUserImageResponse {
  final String accessToken;
  final String refreshToken;
  final Multimedia image;

  factory UpdateUserImageResponse.fromJson(Map<String, dynamic> json) => _$UpdateUserImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserImageResponseToJson(this);

  const UpdateUserImageResponse({required this.accessToken, required this.refreshToken, required this.image});
}