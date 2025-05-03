import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/balance_state/balance_state.dart';

@immutable
class BalanceBaseAction extends AppAction{
  const BalanceBaseAction();
}

@immutable
class LoadBalanceAction extends BalanceBaseAction{
  const LoadBalanceAction();
}
@immutable
class LoadBalanceSuccessAction extends BalanceBaseAction{
  final BalanceState balance;
  const LoadBalanceSuccessAction({required this.balance});
}