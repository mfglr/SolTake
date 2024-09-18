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
class LogOutAction extends AppAction{
  const LogOutAction();
}

@immutable
class LoginByPasswordAction extends AppAction{
  final String emailOrPassword;
  final String password;
  const LoginByPasswordAction({required this.emailOrPassword, required this.password});
}

@immutable
class LoginByFaceBookAction extends AppAction{
  final String accessToken;
  const LoginByFaceBookAction({required this.accessToken});
}

@immutable
class LoginByGoogleAction extends AppAction{
  final String accessToken;
  const LoginByGoogleAction({required this.accessToken});
}

@immutable
class CreateAccountAction extends AppAction{
  final String email;
  final String password;
  final String passwordConfirmation;
  const CreateAccountAction({required this.email, required this.password, required this.passwordConfirmation});
}