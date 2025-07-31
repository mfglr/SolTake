import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';

@immutable
class LoadUserAction extends AppAction{
  final int id;
  const LoadUserAction({required this.id});
}
@immutable
class LoadUserByUserNameAction extends AppAction{
  final String userName;
  const LoadUserByUserNameAction({required this.userName});
}
@immutable
class LoadUserSuccessAction extends AppAction{
  final UserState user;
  const LoadUserSuccessAction({required this.user});
}
@immutable
class LoadUserFailedAction extends AppAction{
  final int id;
  const LoadUserFailedAction({required this.id});
}
@immutable
class UserNotFoundAction extends AppAction{
  final int id;
  const UserNotFoundAction({required this.id});
}