import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/users_state/follow_state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection/entity_collection.dart';
import 'package:my_social_app/state/entity_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class UsersState {
  final EntityCollection<int, UserState> usersById;
  final EntityCollection<String, UserState> usersByUserName;
  final Map<int, Pagination<int, FollowState>> followers;
  final Map<int, Pagination<int, FollowState>> followeds;

  const UsersState({
    required this.usersById,
    required this.usersByUserName,
    required this.followeds,
    required this.followers
  });

  UsersState _optional({
    EntityCollection<int,UserState>? newUsersById,
    EntityCollection<String,UserState>? newUsersByUserName,
    Map<int, Pagination<int, FollowState>>? newFollowers,
    Map<int, Pagination<int, FollowState>>? newFolloweds,
  }) =>
    UsersState(
      usersById: newUsersById ?? usersById,
      usersByUserName: newUsersByUserName ?? usersByUserName,
      followers: newFollowers ?? followers,
      followeds: newFolloweds ?? followeds
    );

  UsersState createQuestion(QuestionState question) =>
    _optional(
      newUsersById: usersById.updateOne(question.userId, usersById[question.userId].entity?.createQuestion()),
      newUsersByUserName: usersByUserName.updateOne(question.userName, usersByUserName[question.userName].entity?.createQuestion())
    );

  UsersState follow(UserState follower, UserState followed) =>
    _optional(
      newUsersById: usersById.setOne(follower.id, followed.follow()),
      newUsersByUserName: usersByUserName.setOne(follower.userName, followed.follow()),
      newFolloweds: followeds.setOne(follower.id, followeds[follower.id]?.prependOne(followed.toFollowed()))
    );

  UsersState loadUsersById(int id) => _optional(newUsersById: usersById.loading(id));
  UsersState successUsersById(UserState user) => _optional(newUsersById: usersById.success(user.id, user));
  UsersState failedUsersById(int id) => _optional(newUsersById: usersById.failed(id));
  UsersState notFoundUsersById(int id) => _optional(newUsersById: usersById.notFound(id));
  
  UsersState loadUsersByUserName(String userName) => _optional(newUsersByUserName: usersByUserName.loading(userName));
  UsersState successUsersByUserName(UserState user) => _optional(newUsersByUserName: usersByUserName.success(user.userName, user));
  UsersState failedUsersByUserName(String userName) => _optional(newUsersByUserName: usersByUserName.failed(userName));
  UsersState notFoundUsersByUserName(String userName) => _optional(newUsersByUserName: usersByUserName.notFound(userName));
}