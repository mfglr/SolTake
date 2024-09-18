// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      (json['id'] as num).toInt(),
      DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['userName'] as String,
      json['email'] as String?,
      json['emailConfirmed'] as bool,
      json['isThirdPartyAuthenticated'] as bool,
      json['accessToken'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'email': instance.email,
      'userName': instance.userName,
      'emailConfirmed': instance.emailConfirmed,
      'isThirdPartyAuthenticated': instance.isThirdPartyAuthenticated,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
