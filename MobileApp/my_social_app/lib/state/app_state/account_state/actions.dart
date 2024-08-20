import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import '../actions.dart' as redux;

@immutable
class UpdateAccountStateAction extends redux.Action{
  final AccountState? payload;
  const UpdateAccountStateAction({required this.payload});
}

@immutable
class ConfirmEmailByTokenAction extends redux.Action{
  final String token;
  const ConfirmEmailByTokenAction({required this.token});
}

@immutable
class LogOutAction extends redux.Action{
  const LogOutAction();
}


@immutable
class LoginByPasswordAction extends redux.Action{
  final String emailOrPassword;
  final String password;
  const LoginByPasswordAction({required this.emailOrPassword, required this.password});
}

@immutable
class CreateAccountAction extends redux.Action{
  final String email;
  final String password;
  final String passwordConfirmation;
  const CreateAccountAction({required this.email, required this.password, required this.passwordConfirmation});
}