// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['id'] as String,
      json['email'] as String,
      json['userName'] as String,
      bool.tryParse(json['emailConfirmed'].toString().toLowerCase())!,
      Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'emailConfirmed': instance.emailConfirmed,
      'token': instance.token,
    };
