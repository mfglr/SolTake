import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/login_state/login_status.dart';

class Login {
  final LoginStatus status;
  final LoginState? login;

  Login({required this.status, required this.login});
  factory Login.init() => Login(status: LoginStatus.loading, login: null);
  factory Login.notLogin() => Login(status: LoginStatus.notLogin, login: null);
  
  Login success(LoginState login) => Login(status: LoginStatus.success,login: login);
  Login loading() => Login(status: LoginStatus.loading, login: login);
  Login notLogin() => Login(status: LoginStatus.notLogin, login: login);

  Login confirmEmail() => Login(status: status, login: login?.confirmEmail());
  Login updateLanguage(String language) => Login(status: status, login: login?.updateLanguage(language));
  Login updateRefhreshToken(String refreshToken) => Login(status: status, login: login?.updateRefhreshToken(refreshToken));
  Login approvePrivacyPolicy() => Login(status: status, login: login?.approvePrivacyPolicy());
  Login approveTermsOfUse() => Login(status: status, login: login?.approveTermsOfUse());
}