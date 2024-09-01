import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/state.dart';

@immutable
abstract class Action{
  const Action();
}

@immutable
class ClearAppStateAction extends Action{
  const ClearAppStateAction();
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


@immutable
class GetNextPageExamsIfNoPageAction extends Action{
  const GetNextPageExamsIfNoPageAction();
}
@immutable
class GetNextPageExamsIfReadyAction extends Action{
  const GetNextPageExamsIfReadyAction();
}
@immutable
class GetNextPageExamsAction extends Action{
  const GetNextPageExamsAction();
}
@immutable
class AddNextPageExamsAction extends Action{
  final Iterable<int> examIds;
  const AddNextPageExamsAction({required this.examIds});
}

