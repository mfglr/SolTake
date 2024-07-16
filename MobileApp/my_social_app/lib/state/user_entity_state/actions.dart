import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/user_entity_state/user_state.dart';

@immutable
class LoadUserAction extends redux.Action{
  final int userId;
  const LoadUserAction({required this.userId});
}
@immutable
class UserSuccessfullyLoadedAction extends redux.Action{
  final UserState payload;
  const UserSuccessfullyLoadedAction({required this.payload});
}

@immutable
class UsersSuccessfullyLoadedAction extends redux.Action{
  final List<UserState> payload;
  const UsersSuccessfullyLoadedAction({required this.payload});
}

@immutable
class LoadFollowersIfNoUsersAction extends redux.Action{
  final int userId;
  const LoadFollowersIfNoUsersAction({required this.userId});
}
@immutable
class LoadFollowersAction extends redux.Action{
  final int userId;
  const LoadFollowersAction({required this.userId});
}
@immutable
class FollowersSuccessfullyLoadedAction extends redux.Action{
  final int userId;
  final List<UserState> payload;
  const FollowersSuccessfullyLoadedAction({required this.userId, required this.payload});
}

@immutable
class LoadFollowedsIfNoUsersAction extends redux.Action{
  final int userId;
  const LoadFollowedsIfNoUsersAction({required this.userId});
}
@immutable
class LoadFollowedsAction extends redux.Action{
  final int userId;
  const LoadFollowedsAction({required this.userId});
}
@immutable
class FollowedsSuccessfullyLoadedAction extends redux.Action{
  final int userId;
  final List<UserState> payload;
  const FollowedsSuccessfullyLoadedAction({required this.userId, required this.payload});
}

@immutable
class LoadUserQuestionsAction extends redux.Action{
  final int userId;
  final List<int> payload;
  const LoadUserQuestionsAction({required this.userId,required this.payload});
}

@immutable
class LoadUserImageAction extends redux.Action{
  final int userId;
  const LoadUserImageAction({required this.userId});
}
@immutable
class UserImageSuccessfullyloadedAction extends redux.Action{
  final int userId;
  final Uint8List paylaod;
  const UserImageSuccessfullyloadedAction({required this.userId,required this.paylaod});
}


@immutable
class MakeFollowRequestAction extends redux.Action{
  final int userId;
  const MakeFollowRequestAction({required this.userId});
}
@immutable
class FollowRequestSuccessfullyIsMadeAction extends redux.Action{
  final int currentUserId;
  final int userId;
  const FollowRequestSuccessfullyIsMadeAction({required this.currentUserId, required this.userId});
}

@immutable
class CancelFollowRequestAction extends redux.Action{
  final int userId;
  const CancelFollowRequestAction({required this.userId});
}
@immutable
class FollowRequestSuccessfullyCancelledAction extends redux.Action{
  final int currentUserId;
  final int userId;
  const FollowRequestSuccessfullyCancelledAction({required this.currentUserId,required this.userId});
}

@immutable
class AddQuestionAction extends redux.Action{
  final int currentUserId;
  final int questionId;
  const AddQuestionAction({required this.currentUserId,required this.questionId});
}