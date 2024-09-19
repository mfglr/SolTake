import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class UpdateAccountStateAction extends AppAction{
  final AccountState? payload;
  const UpdateAccountStateAction({required this.payload});
}

@immutable
class ConfirmEmailByTokenAction extends AppAction{
  final String token;
  const ConfirmEmailByTokenAction({required this.token});
}

@immutable
class LoginByRefreshToken extends AppAction{
  const LoginByRefreshToken();
}

@immutable
class LoginByPasswordAction extends AppAction{
  final String emailOrPassword;
  final String password;
  const LoginByPasswordAction({required this.emailOrPassword, required this.password});
}

@immutable
class LoginByFaceBookAction extends AppAction{
  const LoginByFaceBookAction();
}

@immutable
class LoginByGoogleAction extends AppAction{
  const LoginByGoogleAction();
}

@immutable
class LogOutAction extends AppAction{
  const LogOutAction();
}

@immutable
class CreateAccountAction extends AppAction{
  final String email;
  final String password;
  final String passwordConfirmation;
  const CreateAccountAction({required this.email, required this.password, required this.passwordConfirmation});
}