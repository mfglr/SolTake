// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_name_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserNameResponse _$UpdateUserNameResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserNameResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$UpdateUserNameResponseToJson(
        UpdateUserNameResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
