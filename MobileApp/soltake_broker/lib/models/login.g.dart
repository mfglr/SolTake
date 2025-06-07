// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      email: json['email'] as String,
      isEmailVerified: json['isEmailVerified'] as bool,
      language: json['language'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      isPrivacyPolicyApproved: json['isPrivacyPolicyApproved'] as bool,
      isTermsOfUseApproved: json['isTermsOfUseApproved'] as bool,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'email': instance.email,
      'isEmailVerified': instance.isEmailVerified,
      'isPrivacyPolicyApproved': instance.isPrivacyPolicyApproved,
      'isTermsOfUseApproved': instance.isTermsOfUseApproved,
      'language': instance.language,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
