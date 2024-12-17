// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      email: json['email'] as String,
      userName: json['userName'] as String,
      isEmailVerified: json['isEmailVerified'] as bool,
      language: json['language'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      isPrivacyPolicyApproved: json['isPrivacyPolicyApproved'] as bool,
      isTermsOfUseApproved: json['isTermsOfUseApproved'] as bool,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'email': instance.email,
      'userName': instance.userName,
      'isEmailVerified': instance.isEmailVerified,
      'isPrivacyPolicyApproved': instance.isPrivacyPolicyApproved,
      'isTermsOfUseApproved': instance.isTermsOfUseApproved,
      'language': instance.language,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
