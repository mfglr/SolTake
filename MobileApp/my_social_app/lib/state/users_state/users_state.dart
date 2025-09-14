import 'package:flutter/material.dart';
import 'package:my_social_app/state/questions_state/question_state.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/packages/entity_state/entity_collection.dart';

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

  UsersState loadUsersById(int id) => _optional(newUsersById: usersById.load(id));
  UsersState loadSuccessUsersById(UserState user)
    => _optional(
        newUsersById: usersById.loadSuccess(user.id, user),
        newUsersByUserName: usersByUserName.loadSuccess(user.userName, user)
      );
  UsersState loadFailedUsersById(int id) => _optional(newUsersById: usersById.loadFailed(id));
  UsersState notFoundUsersById(int id) => _optional(newUsersById: usersById.notFound(id));
  
  UsersState loadUsersByUserName(String userName) => _optional(newUsersByUserName: usersByUserName.create(userName));
  UsersState loadSuccessUsersByUserName(UserState user)
    => _optional(
        newUsersById: usersById.loadSuccess(user.id, user),
        newUsersByUserName: usersByUserName.loadSuccess(user.userName, user)
      );
  UsersState loadFailedUsersByUserName(String userName) => 
    _optional(newUsersByUserName: usersByUserName.loadFailed(userName));
  UsersState notFoundUsersByUserName(String userName) =>
    _optional(newUsersByUserName: usersByUserName.notFound(userName));

  UsersState updateName(int userId, String name){
    if(usersById[userId].isNotLoadSuccess) return this;
    final user = usersById[userId].entity!;
    return _optional(
      newUsersById: usersById.update(userId, user.updateName(name)),
      newUsersByUserName: usersByUserName.update(user.userName, user.updateName(name))
    );
  }
   
  UsersState updateUserName(int userId, String userName){
    if(usersById[userId].isNotLoadSuccess) return this;
    final user = usersById[userId].entity!;
    return _optional(
      newUsersById: usersById.update(userId, user.updateUserName(userName)),
      newUsersByUserName: 
        usersByUserName
          .delete(user.userName)
          .loadSuccess(user.userName, user.updateUserName(userName))
    );
  }

  UsersState updateBiography(int userId, String biography){
    if(usersById[userId].isNotLoadSuccess) return this;
    final user = usersById[userId].entity!;
    return _optional(
      newUsersById: usersById.update(userId, user.updateBiography(biography)),
      newUsersByUserName: usersByUserName.update(user.userName, user.updateBiography(biography))
    );
  }

  //questions
  UsersState createQuestion(QuestionState question) =>
    _optional(
      newUsersById:
        usersById
          .update(question.userId, usersById[question.userId].entity?.createQuestion()),
      newUsersByUserName:
        usersByUserName
          .update(question.userName, usersByUserName[question.userName].entity?.createQuestion())
    );
  UsersState deleteQuestion(QuestionState question) =>
    _optional(
      newUsersById:
        usersById
          .update(question.userId, usersById[question.userId].entity?.deleteQuestion()),
      newUsersByUserName:
        usersByUserName
          .update(question.userName, usersByUserName[question.userName].entity?.deleteQuestion())
    );
  //questions

  //follows
  UsersState follow(UserState follower, UserState followed, int followId) =>
    _optional(
      newUsersById:
        usersById
          .update(followed.id, followed.follow())
          .update(follower.id, follower.increaseNumberFolloweds()),
      newUsersByUserName:
        usersByUserName
          .update(followed.userName, followed.follow())
          .update(follower.userName, follower.increaseNumberFolloweds()),
    );
  UsersState unfollow(UserState follower, UserState followed) =>
    _optional(
      newUsersById:
        usersById
          .update(followed.id, followed.unfollow())
          .update(follower.id, follower.decreaseNumberFolloweds()),
      newUsersByUserName:
        usersByUserName
          .update(followed.userName, followed.unfollow())
          .update(follower.userName, follower.decreaseNumberFolloweds()),
    );
  //follows
  
}