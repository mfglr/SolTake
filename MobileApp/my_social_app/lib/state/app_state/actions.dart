import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/active_account_page.dart';


@immutable
class AppAction{
  const AppAction();
}

@immutable
class ClearStateAction{
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

@immutable
class ChangeActiveAccountPageAction extends AppAction{
  final ActiveAccountPage activeAccountPage;
  const ChangeActiveAccountPageAction({required this.activeAccountPage});
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
