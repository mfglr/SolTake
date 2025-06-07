import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:soltake_broker/state/app_state/login_state/login_state.dart';
part 'login.g.dart';

@immutable
@JsonSerializable()
class Login{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String email;
  final bool isEmailVerified;
  final bool isPrivacyPolicyApproved;
  final bool isTermsOfUseApproved;
  final String language;
  final String accessToken;
  final String refreshToken;
  
  const Login({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.email,
    required this.isEmailVerified,
    required this.language,
    required this.accessToken,
    required this.refreshToken,
    required this.isPrivacyPolicyApproved,
    required this.isTermsOfUseApproved,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
  
  LoginState toState()
    => LoginState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        email: email,
        isEmailVerified: isEmailVerified,
        isPrivacyPolicyApproved: isPrivacyPolicyApproved,
        isTermsOfUseApproved: isTermsOfUseApproved,
        language: language,
        refreshToken: refreshToken,
      );
}