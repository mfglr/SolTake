import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/login_state/login_status.dart';

class Login {
  final LoginStatus status;
  final LoginState? login;

  Login({required this.status, required this.login});
  
  Login success(LoginState login) => Login(status: LoginStatus.success,login: login);
  Login failed() => Login(status: LoginStatus.failed, login: login);
  Login trying() => Login(status: LoginStatus.trying, login: login);
  Login confirmEmail() => Login(status: status, login: login?.confirmEmail());
  Login updateLanguage(String language) => Login(status: status, login: login?.updateLanguage(language));
  Login updateRefhreshToken(String refreshToken) => Login(status: status, login: login?.updateRefhreshToken(refreshToken));
  Login approvePrivacyPolicy() => Login(status: status, login: login?.approvePrivacyPolicy());
  Login approveTermsOfUse() => Login(status: status, login: login?.approveTermsOfUse());
}