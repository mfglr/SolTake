import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/balance_state/balance_state.dart';
part 'balance.g.dart';

@JsonSerializable()
@immutable
class Balance{
  final int balance;
  
  const Balance({required this.balance});

  factory Balance.fromJson(Map<String, dynamic> json) => _$BalanceFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceToJson(this);

  BalanceState toState() => BalanceState(balance: balance);
}