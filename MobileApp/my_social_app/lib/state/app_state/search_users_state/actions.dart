import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';

@immutable
class FirstSearchUsersAction extends AppAction{
  final String key;
  const FirstSearchUsersAction({required this.key});
}
@immutable
class FirstSearchUsersSuccessAction extends AppAction{
  final Iterable<SearchUserState> users;
  const FirstSearchUsersSuccessAction({required this.users});
}
@immutable
class FirstSearchUsersFailedAction extends AppAction{
  const FirstSearchUsersFailedAction();
}

@immutable
class NextSearchUsersAction extends AppAction{
  final String key;
  const NextSearchUsersAction({required this.key});
}
@immutable
class NextSearchUsersSuccessAction extends AppAction{
  final Iterable<SearchUserState> users;
  const NextSearchUsersSuccessAction({required this.users});
}
@immutable
class NextSearchUsersFailedAction extends AppAction{
  const NextSearchUsersFailedAction();
}

@immutable
class PrevSearchUsersAction extends AppAction{
  final String key;
  const PrevSearchUsersAction({required this.key});
}
@immutable
class PrevSearchUsersSuccessAction extends AppAction{
  final Iterable<SearchUserState> users;
  const PrevSearchUsersSuccessAction({required this.users});
}
@immutable
class PrevSearchUsersFailedAction extends AppAction{
  const PrevSearchUsersFailedAction();
}