import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/users_state/follow_state.dart';
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

@immutable
class FollowAction extends AppAction{
  final UserState followed;
  const FollowAction({required this.followed});
}
@immutable
class FollowSuccessAction extends AppAction{
  final UserState follower;
  final UserState followed;
  final int followId;
  const FollowSuccessAction({required this.follower, required this.followed, required this.followId});
}

@immutable
class UnfollowAction extends AppAction{
  final UserState followed;
  const UnfollowAction({required this.followed});
}
@immutable
class UnfollowSuccessAction extends AppAction{
  final UserState follower;
  final UserState followed;
  const UnfollowSuccessAction({required this.follower, required this.followed});
}

@immutable
class NextFollowersAction extends AppAction{
  final int userId;
  const NextFollowersAction({required this.userId});
}
@immutable
class NextFollowersSuccessAction extends AppAction{
  final int userId;
  final Iterable<FollowState> followers;
  const NextFollowersSuccessAction({required this.userId, required this.followers});
}
@immutable
class NextFollowersFailedAction extends AppAction{
  final int userId;
  const NextFollowersFailedAction({required this.userId});
}

@immutable
class RefreshFollowersAction extends AppAction{
  final int userId;
  const RefreshFollowersAction({required this.userId});
}
@immutable
class RefreshFollowersSuccessAction extends AppAction{
  final int userId;
  final Iterable<FollowState> followers;
  const RefreshFollowersSuccessAction({required this.userId, required this.followers});
}
@immutable
class RefreshFollowersFailedAction extends AppAction{
  final int userId;
  const RefreshFollowersFailedAction({required this.userId});
}

@immutable
class NextFollowedsAction extends AppAction{
  final int userId;
  const NextFollowedsAction({required this.userId});
}
@immutable
class NextFollowedsSuccessAction extends AppAction{
  final int userId;
  final Iterable<FollowState> followeds;
  const NextFollowedsSuccessAction({required this.userId, required this.followeds});
}
@immutable
class NextFollowedsFailedAction extends AppAction{
  final int userId;
  const NextFollowedsFailedAction({required this.userId});
}

@immutable
class RefreshFollowedsAction extends AppAction{
  final int userId;
  const RefreshFollowedsAction({required this.userId});
}
@immutable
class RefreshFollowedsSuccessAction extends AppAction{
  final int userId;
  final Iterable<FollowState> followeds;
  const RefreshFollowedsSuccessAction({required this.userId, required this.followeds});
}
@immutable
class RefreshFollowedsFailedAction extends AppAction{
  final int userId;
  const RefreshFollowedsFailedAction({required this.userId});
}
