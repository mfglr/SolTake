// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      json['accessToken'] as String,
      DateTime.parse(json['expirationDateOfAccessToken'] as String),
      json['refreshToken'] as String,
      DateTime.parse(json['expirationDateOfRefreshToken'] as String),
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'expirationDateOfAccessToken':
          instance.expirationDateOfAccessToken.toIso8601String(),
      'refreshToken': instance.refreshToken,
      'expirationDateOfRefreshToken':
          instance.expirationDateOfRefreshToken.toIso8601String(),
    };
