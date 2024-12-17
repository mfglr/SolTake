// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountState _$AccountStateFromJson(Map<String, dynamic> json) => AccountState(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      email: json['email'] as String,
      userName: json['userName'] as String,
      isEmailVerified: json['isEmailVerified'] as bool,
      language: json['language'] as String,
      refreshToken: json['refreshToken'] as String,
      isPrivacyPolicyApproved: json['isPrivacyPolicyApproved'] as bool,
      isTermsOfUseApproved: json['isTermsOfUseApproved'] as bool,
      accountDeletionStart: json['accountDeletionStart'] as bool,
    );

Map<String, dynamic> _$AccountStateToJson(AccountState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'email': instance.email,
      'userName': instance.userName,
      'isEmailVerified': instance.isEmailVerified,
      'isPrivacyPolicyApproved': instance.isPrivacyPolicyApproved,
      'isTermsOfUseApproved': instance.isTermsOfUseApproved,
      'language': instance.language,
      'refreshToken': instance.refreshToken,
      'accountDeletionStart': instance.accountDeletionStart,
    };
