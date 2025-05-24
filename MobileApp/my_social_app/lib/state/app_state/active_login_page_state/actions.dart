import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/active_login_page_state/active_login_page.dart';

@immutable
class ActiveLoginPageAction extends AppAction{
  const ActiveLoginPageAction();
}

@immutable
class ChangeActiveLoginPage extends ActiveLoginPageAction{
  final ActiveLoginPage loginPage;
  const ChangeActiveLoginPage({required this.loginPage});
}