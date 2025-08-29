import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/users_state/user_state.dart';
import 'package:my_social_app/state/entity_state/entity_collection.dart';

@immutable
class UsersState {
  final EntityCollection<int, UserState> usersById;
  final EntityCollection<String, UserState> usersByUserName;

  const UsersState({
    required this.usersById,
    required this.usersByUserName,
  });

  UsersState _optional({
    EntityCollection<int,UserState>? newUsersById,
    EntityCollection<String,UserState>? newUsersByUserName,
  }) =>
    UsersState(
      usersById: newUsersById ?? usersById,
      usersByUserName: newUsersByUserName ?? usersByUserName,
    );

  UsersState loadUsersById(int id) => _optional(newUsersById: usersById.loading(id));
  UsersState successUsersById(UserState user)
    => _optional(
        newUsersById: usersById.success(user.id, user),
        newUsersByUserName: usersByUserName.success(user.userName, user)
      );
  UsersState failedUsersById(int id) => _optional(newUsersById: usersById.failed(id));
  UsersState notFoundUsersById(int id) => _optional(newUsersById: usersById.notFound(id));
  
  UsersState loadUsersByUserName(String userName) => _optional(newUsersByUserName: usersByUserName.loading(userName));
  UsersState successUsersByUserName(UserState user)
    => _optional(
        newUsersById: usersById.success(user.id, user),
        newUsersByUserName: usersByUserName.success(user.userName, user)
      );
  UsersState failedUsersByUserName(String userName) => _optional(newUsersByUserName: usersByUserName.failed(userName));
  UsersState notFoundUsersByUserName(String userName) => _optional(newUsersByUserName: usersByUserName.notFound(userName));

  UsersState updateName(int userId, String name){
    if(usersById[userId].isNotSuccess) return this;
    final user = usersById[userId].entity!;
    return _optional(
      newUsersById: usersById.successOne(userId, user.updateName(name)),
      newUsersByUserName: usersByUserName.successOne(user.userName, user.updateName(name))
    );
  }
   
  UsersState updateUserName(int userId, String userName){
    if(usersById[userId].isNotSuccess) return this;
    final user = usersById[userId].entity!;
    return _optional(
      newUsersById: usersById.successOne(userId, user.updateUserName(userName)),
      newUsersByUserName: 
        usersByUserName
          .removeOne(user.userName)
          .successOne(user.userName, user.updateUserName(userName))
    );
  }

  UsersState updateBiography(int userId, String biography){
    if(usersById[userId].isNotSuccess) return this;
    final user = usersById[userId].entity!;
    return _optional(
      newUsersById: usersById.successOne(userId, user.updateBiography(biography)),
      newUsersByUserName: usersByUserName.successOne(user.userName, user.updateBiography(biography))
    );
  }

  //questions
  UsersState createQuestion(QuestionState question) =>
    _optional(
      newUsersById:
        usersById
          .updateOne(question.userId, usersById[question.userId].entity?.createQuestion()),
      newUsersByUserName:
        usersByUserName
          .updateOne(question.userName, usersByUserName[question.userName].entity?.createQuestion())
    );
  UsersState deleteQuestion(QuestionState question) =>
    _optional(
      newUsersById:
        usersById
          .updateOne(question.userId, usersById[question.userId].entity?.deleteQuestion()),
      newUsersByUserName:
        usersByUserName
          .updateOne(question.userName, usersByUserName[question.userName].entity?.deleteQuestion())
    );
  //questions

  //follows
  UsersState follow(UserState follower, UserState followed, int followId) =>
    _optional(
      newUsersById:
        usersById
          .updateOne(followed.id, followed.follow())
          .updateOne(follower.id, follower.increaseNumberFolloweds()),
      newUsersByUserName:
        usersByUserName
          .updateOne(followed.userName, followed.follow())
          .updateOne(follower.userName, follower.increaseNumberFolloweds()),
    );
  UsersState unfollow(UserState follower, UserState followed) =>
    _optional(
      newUsersById:
        usersById
          .updateOne(followed.id, followed.unfollow())
          .updateOne(follower.id, follower.decreaseNumberFolloweds()),
      newUsersByUserName:
        usersByUserName
          .updateOne(followed.userName, followed.unfollow())
          .updateOne(follower.userName, follower.decreaseNumberFolloweds()),
    );
  //follows
  
}