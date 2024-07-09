import 'package:flutter/material.dart';
import 'package:my_social_app/state/account_state/account_state.dart';
import '../actions.dart' as redux;

@immutable
class UpdateAccountStateAction implements redux.Action{
  final AccountState payload;
  const UpdateAccountStateAction({required this.payload});
}

@immutable
class InitAccountStateAction extends redux.Action{
  const InitAccountStateAction();
}