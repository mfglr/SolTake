import 'package:flutter/cupertino.dart';
import 'package:soltake_broker/state/app_state/actions.dart';
import 'package:soltake_broker/state/app_state/login_state/login_state.dart';

@immutable
class LoginAction extends AppAction{
  const LoginAction();
}
@immutable
class LoginByPasswordAction extends LoginAction{
  final String emailOrUserName;
  final String password;

  const LoginByPasswordAction({
    required this.emailOrUserName,
    required this.password
  });
}
@immutable
class LoginByRefreshTokenAction extends LoginAction{
  const LoginByRefreshTokenAction();
}
@immutable
class LoginSuccessAction extends LoginAction{
  final LoginState? login;
  const LoginSuccessAction({required this.login});
}
