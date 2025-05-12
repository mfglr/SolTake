import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/login_state/login_status.dart';

class Login {
  final LoginStatus status;
  final LoginState? login;

  Login({required this.status, required this.login});
  
  Login success(LoginState login) => Login(status: LoginStatus.success,login: login);
  Login failed() => Login(status: LoginStatus.failed, login: login);
  Login trying() => Login(status: LoginStatus.trying, login: login);
}