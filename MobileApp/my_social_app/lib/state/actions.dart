import 'package:flutter/material.dart';
import 'package:my_social_app/state/state.dart';

@immutable
abstract class Action{
  const Action();
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
