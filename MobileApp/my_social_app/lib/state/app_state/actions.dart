import 'package:flutter/material.dart';

@immutable
abstract class Action{
  const Action();
}

@immutable
class AppAction extends Action{
  const AppAction();
}

@immutable
class ClearStateAction extends Action{
  const ClearStateAction();
}

class ChangeAccessTokenAction extends AppAction{
  final String? accessToken;
  const ChangeAccessTokenAction({required this.accessToken});
}

@immutable
class ApplicationSuccessfullyInitAction extends AppAction{
  const ApplicationSuccessfullyInitAction();
}

//exams//
@immutable
class NextExamsAction extends AppAction{
  const NextExamsAction();
}
@immutable
class NextExamsSuccessAction extends AppAction{
  final Iterable<int> examIds;
  const NextExamsSuccessAction({required this.examIds});
}
@immutable
class NextExamsFailedAction extends AppAction{
  const NextExamsFailedAction();
}
//exams//
