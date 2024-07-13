// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountState _$AccountStateFromJson(Map<String, dynamic> json) => AccountState(
      (json['id'] as num).toInt(),
      DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['email'] as String,
      json['userName'] as String,
      json['emailConfirmed'] as bool,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$AccountStateToJson(AccountState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'email': instance.email,
      'userName': instance.userName,
      'emailConfirmed': instance.emailConfirmed,
      'refreshToken': instance.refreshToken,
    };
