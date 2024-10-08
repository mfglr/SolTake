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
  final bool emailConfirmed;
  final bool isThirdPartyAuthenticated;
  final bool isPrivacyPolicyApproved;
  final bool isTermsOfUseApproved;
  final String? language;
  final String refreshToken;

  const AccountState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.userName,
    required this.emailConfirmed,
    required this.isThirdPartyAuthenticated,
    required this.language,
    required this.refreshToken,
    required this.isPrivacyPolicyApproved,
    required this.isTermsOfUseApproved,
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
        emailConfirmed: true,
        isThirdPartyAuthenticated: isThirdPartyAuthenticated,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        isTermsOfUseApproved: isTermsOfUseApproved,
        language: language,
        refreshToken: refreshToken
      );

  AccountState updateLanguage(String language)
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        emailConfirmed: emailConfirmed,
        isThirdPartyAuthenticated: isThirdPartyAuthenticated,
        isTermsOfUseApproved: isTermsOfUseApproved,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        language: language,
        refreshToken: refreshToken
      );

  AccountState approvePrivacyPolicy()
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        emailConfirmed: emailConfirmed,
        isThirdPartyAuthenticated: isThirdPartyAuthenticated,
        isTermsOfUseApproved: isTermsOfUseApproved,
        isPrivacyPolicyApproved: true,
        language: language,
        refreshToken: refreshToken,
        
      );
  AccountState approveTermsOfUse()
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        emailConfirmed: emailConfirmed,
        isThirdPartyAuthenticated: isThirdPartyAuthenticated,
        isTermsOfUseApproved: true,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        language: language,
        refreshToken: refreshToken,
        
      );
}