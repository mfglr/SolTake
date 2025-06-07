import 'package:flutter/widgets.dart';
import 'package:soltake_broker/state/app_state/login_state/login_state.dart';

@immutable
class LoginContainer {
  final LoginState? login;
  final bool isLoading;

  const LoginContainer({
    required this.login,
    required this.isLoading
  });

  factory LoginContainer.init() => LoginContainer(login: null, isLoading: false);

  LoginContainer loading() => LoginContainer(login: login, isLoading: true);
  LoginContainer updateLogin(LoginState? login) => LoginContainer(login: login, isLoading: false);
}