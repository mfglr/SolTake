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
    required this.refreshToken
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
        language: language,
        refreshToken: refreshToken
      ); 
}