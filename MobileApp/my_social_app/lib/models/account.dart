import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
part 'account.g.dart';

@JsonSerializable()
@immutable
class Account{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String email;
  final String userName;
  final bool isEmailVerified;
  final bool isPrivacyPolicyApproved;
  final bool isTermsOfUseApproved;
  final String language;
  final String accessToken;
  final String refreshToken;
  
  const Account({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.userName,
    required this.isEmailVerified,
    required this.language,
    required this.accessToken,
    required this.refreshToken,
    required this.isPrivacyPolicyApproved,
    required this.isTermsOfUseApproved,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
  
  AccountState toAccountState()
    => AccountState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        userName: userName,
        isEmailVerified: isEmailVerified,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        isTermsOfUseApproved: isTermsOfUseApproved,
        language: language,
        refreshToken: refreshToken,
        accountDeletionStart: false
      );
}