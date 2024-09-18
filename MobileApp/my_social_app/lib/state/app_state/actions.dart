import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/state.dart';

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

@immutable
class InitAppAction extends Action{
  const InitAppAction();
}

class ChangeAccessTokenAction extends AppAction{
  final String? accessToken;
  const ChangeAccessTokenAction({required this.accessToken});
}

@immutable
class ChangeActiveLoginPageAction extends AppAction{
  final ActiveLoginPage payload;
  const ChangeActiveLoginPageAction({required this.payload});
}

@immutable
class ApplicationSuccessfullyInitAction extends AppAction{
  const ApplicationSuccessfullyInitAction();
}

//exams//
@immutable
class GetNextPageExamsIfNoPageAction extends AppAction{
  const GetNextPageExamsIfNoPageAction();
}
@immutable
class GetNextPageExamsIfReadyAction extends AppAction{
  const GetNextPageExamsIfReadyAction();
}
@immutable
class GetNextPageExamsAction extends AppAction{
  const GetNextPageExamsAction();
}
@immutable
class AddNextPageExamsAction extends AppAction{
  final Iterable<int> examIds;
  const AddNextPageExamsAction({required this.examIds});
}
//exams//
