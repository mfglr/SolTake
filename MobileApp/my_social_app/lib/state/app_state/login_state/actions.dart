import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class LoginSuccessAction extends AppAction{
  final LoginState payload;
  const LoginSuccessAction({required this.payload});
}
@immutable
class LoginFailedAction extends AppAction{
  const LoginFailedAction();
}


@immutable
class UpdateLoginStateAction extends AppAction{
  final LoginState? payload;
  const UpdateLoginStateAction({required this.payload});
}


@immutable
class LoginByRefreshTokenAction extends AppAction{
  const LoginByRefreshTokenAction();
}

@immutable
class LoginByPasswordAction extends AppAction{
  final String emailOrPassword;
  final String password;
  const LoginByPasswordAction({required this.emailOrPassword, required this.password});
}

@immutable
class LoginByGoogleAction extends AppAction{
  const LoginByGoogleAction();
}

@immutable
class UpdateRefreshTokenAction extends AppAction{
  final String refreshToken;
  const UpdateRefreshTokenAction({required this.refreshToken});
}

@immutable
class UpdateLanguageAction extends AppAction{
  final String language;
  const UpdateLanguageAction({required this.language});
}
@immutable
class UpdateLanguageSuccessAction extends AppAction{
  final String language;
  const UpdateLanguageSuccessAction({required this.language});
}

@immutable
class ConfirmEmailByTokenAction extends AppAction{
  final String token;
  const ConfirmEmailByTokenAction({required this.token});
}
@immutable
class ConfirmEmailByTokenSuccessAction extends AppAction{
  const ConfirmEmailByTokenSuccessAction();
}

@immutable
class LogOutAction extends AppAction{
  const LogOutAction();
}

@immutable
class DeleteUserAction extends AppAction{
  const DeleteUserAction();
}
@immutable
class DeleteUserFailedAction extends AppAction{
  const DeleteUserFailedAction();
}

@immutable
class CreateUserAction extends AppAction{
  final String email;
  final String password;
  final String passwordConfirmation;
  const CreateUserAction({required this.email, required this.password, required this.passwordConfirmation});
}

@immutable
class ApprovePrivacyPolicyAction extends AppAction{
  const ApprovePrivacyPolicyAction();
}
@immutable
class ApprovePrivacyPolicySuccessAction extends AppAction{
  const ApprovePrivacyPolicySuccessAction();
}

@immutable
class ApproveTermsOfUseAction extends AppAction{
  const ApproveTermsOfUseAction();
}
@immutable
class ApproveTermsOfUseSuccessAction extends AppAction{
  const ApproveTermsOfUseSuccessAction();
}
