import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class FirstSearchingUsersAction extends AppAction{
  const FirstSearchingUsersAction();
}
@immutable
class FirstSearchingUsersSuccessAction extends AppAction{
  final Iterable<int> userIds;
  const FirstSearchingUsersSuccessAction({required this.userIds});
}
@immutable
class FirstSearchingUsersFailedAction extends AppAction{
  const FirstSearchingUsersFailedAction();
}

@immutable
class NextSearchingUsersAction extends AppAction{
  const NextSearchingUsersAction();
}
@immutable
class NextSearchingUsersSuccessAction extends AppAction{
  final Iterable<int> userIds;
  const NextSearchingUsersSuccessAction({required this.userIds});
}
@immutable
class NextSearhcingUsersFailedAction extends AppAction{
  const NextSearhcingUsersFailedAction();
}