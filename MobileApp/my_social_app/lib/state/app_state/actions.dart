import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/state.dart';

@immutable
abstract class Action{
  const Action();
}

class ChangeAccessTokenAction extends Action{
  final String? accessToken;
  const ChangeAccessTokenAction({required this.accessToken});
}

@immutable
class ChangeActiveLoginPageAction extends Action{
  final ActiveLoginPage payload;
  const ChangeActiveLoginPageAction({required this.payload});
}

@immutable
class InitAppAction extends Action{
  const InitAppAction();
}

@immutable
class ApplicationSuccessfullyInitAction extends Action{
  const ApplicationSuccessfullyInitAction();
}
