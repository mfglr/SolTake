import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_state.g.dart';

@immutable
@JsonSerializable()
class LoginState{
  final num id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String email;
  final bool isEmailVerified;
  final bool isPrivacyPolicyApproved;
  final bool isTermsOfUseApproved;
  final String language;
  final String refreshToken;
  final bool accountDeletionStart;

  const LoginState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.isEmailVerified,
    required this.language,
    required this.refreshToken,
    required this.isPrivacyPolicyApproved,
    required this.isTermsOfUseApproved,
    required this.accountDeletionStart
  });
  

  factory LoginState.fromJson(Map<String, dynamic> json) => _$LoginStateFromJson(json);
  Map<String, dynamic> toJson() => _$LoginStateToJson(this);

  LoginState confirmEmail()
    => LoginState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        isEmailVerified: true,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        isTermsOfUseApproved: isTermsOfUseApproved,
        language: language,
        refreshToken: refreshToken,
        accountDeletionStart: accountDeletionStart
      );

  LoginState updateLanguage(String language)
    => LoginState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        isEmailVerified: isEmailVerified,
        isTermsOfUseApproved: isTermsOfUseApproved,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        language: language,
        refreshToken: refreshToken,
        accountDeletionStart: accountDeletionStart
      );

  LoginState approvePrivacyPolicy()
    => LoginState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        isEmailVerified: isEmailVerified,
        isTermsOfUseApproved: isTermsOfUseApproved,
        isPrivacyPolicyApproved: true,
        language: language,
        refreshToken: refreshToken,
        accountDeletionStart: accountDeletionStart        
      );
  LoginState approveTermsOfUse()
    => LoginState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        isEmailVerified: isEmailVerified,
        isTermsOfUseApproved: true,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        language: language,
        refreshToken: refreshToken,
        accountDeletionStart: accountDeletionStart
      );
  LoginState startAccountDeletion()
    => LoginState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        isEmailVerified: isEmailVerified,
        language: language,
        refreshToken: refreshToken,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        isTermsOfUseApproved: isTermsOfUseApproved,
        accountDeletionStart: true
      );
  LoginState stopAccountDeletion()
    => LoginState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        isEmailVerified: isEmailVerified,
        language: language,
        refreshToken: refreshToken,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        isTermsOfUseApproved: isTermsOfUseApproved,
        accountDeletionStart: false
      );
}