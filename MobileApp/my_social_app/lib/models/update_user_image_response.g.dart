// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserImageResponse _$UpdateUserImageResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserImageResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      image: Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserImageResponseToJson(
        UpdateUserImageResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'image': instance.image,
    };
