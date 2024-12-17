import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'account_state.g.dart';

@immutable
@JsonSerializable()
class AccountState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? email;
  final String userName;
  final bool isEmailVerified;
  final bool isPrivacyPolicyApproved;
  final bool isTermsOfUseApproved;
  final String language;
  final String refreshToken;
  final bool accountDeletionStart;

  const AccountState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.userName,
    required this.isEmailVerified,
    required this.language,
    required this.refreshToken,
    required this.isPrivacyPolicyApproved,
    required this.isTermsOfUseApproved,
    required this.accountDeletionStart
  });
  

  factory AccountState.fromJson(Map<String, dynamic> json) => _$AccountStateFromJson(json);
  Map<String, dynamic> toJson() => _$AccountStateToJson(this);

  AccountState confirmEmail()
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        isEmailVerified: true,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        isTermsOfUseApproved: isTermsOfUseApproved,
        language: language,
        refreshToken: refreshToken,
        accountDeletionStart: accountDeletionStart
      );

  AccountState updateLanguage(String language)
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        isEmailVerified: isEmailVerified,
        isTermsOfUseApproved: isTermsOfUseApproved,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        language: language,
        refreshToken: refreshToken,
        accountDeletionStart: accountDeletionStart
      );

  AccountState approvePrivacyPolicy()
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        isEmailVerified: isEmailVerified,
        isTermsOfUseApproved: isTermsOfUseApproved,
        isPrivacyPolicyApproved: true,
        language: language,
        refreshToken: refreshToken,
        accountDeletionStart: accountDeletionStart        
      );
  AccountState approveTermsOfUse()
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        isEmailVerified: isEmailVerified,
        isTermsOfUseApproved: true,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        language: language,
        refreshToken: refreshToken,
        accountDeletionStart: accountDeletionStart
      );
  AccountState startAccountDeletion()
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        isEmailVerified: isEmailVerified,
        language: language,
        refreshToken: refreshToken,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        isTermsOfUseApproved: isTermsOfUseApproved,
        accountDeletionStart: true
      );
  AccountState stopAccountDeletion()
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        isEmailVerified: isEmailVerified,
        language: language,
        refreshToken: refreshToken,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        isTermsOfUseApproved: isTermsOfUseApproved,
        accountDeletionStart: false
      );
}