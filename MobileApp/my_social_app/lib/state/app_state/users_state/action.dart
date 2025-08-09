import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';

@immutable
class LoadUserByIdAction extends AppAction{
  final int id;
  const LoadUserByIdAction({required this.id});
}
@immutable
class LoadUserByIdSuccessAction extends AppAction{
  final UserState user;
  const LoadUserByIdSuccessAction({required this.user});
}
@immutable
class LoadUserByIdFailedAction extends AppAction{
  final int id;
  const LoadUserByIdFailedAction({required this.id});
}
@immutable
class UserNotFoundByIdAction extends AppAction{
  final int id;
  const UserNotFoundByIdAction({required this.id});
}

@immutable
class LoadUserByUserNameAction extends AppAction{
  final String userName;
  const LoadUserByUserNameAction({required this.userName});
}
@immutable
class LoadUserByUserNameSuccessAction extends AppAction{
  final UserState user;
  const LoadUserByUserNameSuccessAction({required this.user});
}
@immutable
class LoadUserByUserNameFailedAction extends AppAction{
  final String userName;
  const LoadUserByUserNameFailedAction({required this.userName});
}
@immutable
class UserNotFoundByUserNameAction extends AppAction{
  final String userName;
  const UserNotFoundByUserNameAction({required this.userName});
}

