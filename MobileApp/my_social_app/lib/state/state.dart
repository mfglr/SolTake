import 'package:flutter/material.dart';
import 'package:my_social_app/state/account_state/account_state.dart';

@immutable
class State{
  final AccountState accountState;
  const State({required this.accountState});
}