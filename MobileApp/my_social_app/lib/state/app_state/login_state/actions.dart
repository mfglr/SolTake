import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';

@immutable
class ChangeActiveLoginPageAction extends AppAction{
  final ActiveLoginPage activeLoginPage;
  const ChangeActiveLoginPageAction({required this.activeLoginPage});
}

@immutable
class ChangeLoginLanguageAction extends AppAction{
  final String laguage;
  const ChangeLoginLanguageAction({required this.laguage});
}