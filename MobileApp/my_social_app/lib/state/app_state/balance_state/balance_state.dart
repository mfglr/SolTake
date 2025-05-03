import 'package:flutter/material.dart';

@immutable
class BalanceState {
  final double balance;
  const BalanceState({required this.balance});

  BalanceState update(double balance) => BalanceState(balance: balance);
}