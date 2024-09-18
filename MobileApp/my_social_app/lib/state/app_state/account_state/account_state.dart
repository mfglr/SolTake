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
  final String refreshToken;

  const AccountState(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.userName,
    this.emailConfirmed,
    this.isThirdPartyAuthenticated,
    this.refreshToken,
  );

  factory AccountState.fromJson(Map<String, dynamic> json) => _$AccountStateFromJson(json);
  Map<String, dynamic> toJson() => _$AccountStateToJson(this);

  AccountState confirmEmail()
    => AccountState(id, createdAt, updatedAt, email, userName, true, isThirdPartyAuthenticated, refreshToken);
}