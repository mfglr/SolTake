import 'package:flutter/material.dart';

@immutable
class AccountState{
  final int id;
  final String userName;
  final String accessToken;
  final String refreshToken;

  const AccountState({
    required this.id,
    required this.userName,
    required this.accessToken,
    required this.refreshToken
  });
}