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
class LoginByPasswordSuccessAction extends LoginAction{
  final LoginState login;
  const LoginByPasswordSuccessAction({required this.login});
}

@immutable
class LoginByRefreshTokenAction extends LoginAction{
  final int id;
  final String refreshToken;
  const LoginByRefreshTokenAction({
    required this.id,
    required this.refreshToken,
  });
}
@immutable
class LoginByRefreshTokenSuccessAction extends LoginAction{
  final LoginState login;
  const LoginByRefreshTokenSuccessAction({required this.login});
}

@immutable
class LoginByStorageAction extends LoginAction{
  const LoginByStorageAction();
}
@immutable
class LoginByStorageSuccessAction extends LoginAction{
  final LoginState? login;
  const LoginByStorageSuccessAction({required this.login});
}