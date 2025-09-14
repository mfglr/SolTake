import 'package:flutter/material.dart';

@immutable
class BalanceState {
  final int balance;
  const BalanceState({required this.balance});

  BalanceState update(int balance) => BalanceState(balance: balance);
}