import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';

@immutable
class UserEntityState extends EntityState<UserState>{
  const UserEntityState({required super.entities});

  UserEntityState addUser(UserState value)
    => UserEntityState(entities: appendOne(value));
  UserEntityState addUsers(Iterable<UserState> values)
    => UserEntityState(entities: appendMany(values));
  
  //followers
  UserEntityState getNextPageFollowers(int userId)
    => UserEntityState(entities: updateOne(entities[userId]!.getNextPageFollowers()));
  UserEntityState addNextPageFollowers(int userId, Iterable<int> userIds)
    => UserEntityState(entities: updateOne(entities[userId]!.addNextPageFollowers(userIds)));
  UserEntityState addFollower(int userId, int followerId)
    => UserEntityState(entities: updateOne(entities[userId]!.addFollower(followerId)));
  UserEntityState removeFollower(int userId, int followerId)
    => UserEntityState(entities: updateOne(entities[userId]!.removeFollower(followerId)));

  //foloweds
  UserEntityState getNextPageFolloweds(int userId)
    => UserEntityState(entities: updateOne(entities[userId]!.getNextPageFolloweds()));
  UserEntityState addNextPageFolloweds(int userId, Iterable<int> userIds)
    => UserEntityState(entities: updateOne(entities[userId]!.addNextPageFolloweds(userIds)));
  UserEntityState addFollowed(int userId,int followedId)
    => UserEntityState(entities: updateOne(entities[userId]!.addFollowed(followedId)));
  UserEntityState removeFollowed(int userId,int followedId)
    => UserEntityState(entities: updateOne(entities[userId]!.removeFollowed(followedId)));

  //not followeds
  UserEntityState getNextPageNotFolloweds(int userId)
    => UserEntityState(entities: updateOne(entities[userId]!.getNextPageNotFolloweds()));
  UserEntityState addNextPageNotFolloweds(int userId,Iterable<int> userIds)
    => UserEntityState(entities: updateOne(entities[userId]!.addNextPageNotFolloweds(userIds)));
  UserEntityState removeNotFollowed(int userId,int notFollowedId)
    => UserEntityState(entities: updateOne(entities[userId]!.removeNotFollowed(notFollowedId)));
  UserEntityState addNotFollowed(int userId,int notFollowedId)
    => UserEntityState(entities: updateOne(entities[userId]!.addNotFollowed(notFollowedId)));

  UserEntityState getNextPageQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]!.getNextPageQuestions()));
  UserEntityState addNextPageQuestions(int userId, Iterable<int> questions)
    => UserEntityState(entities: updateOne(entities[userId]!.addNextPageQuestions(questions)));
  UserEntityState addQuestion(int userId,int questionId)
    => UserEntityState(entities: updateOne(entities[userId]!.addQuestion(questionId)));
  

  UserEntityState addMessage(int userId,int messageId)
    => UserEntityState(entities: updateOne(entities[userId]!.addMessage(messageId)));
  UserEntityState getNextPageMessages(int userId)
    => UserEntityState(entities: updateOne(entities[userId]!.nextPageMessages()));
  UserEntityState addNextPageMessages(int userId,Iterable<int> messageIds)
    => UserEntityState(entities: updateOne(entities[userId]!.addNextPageMessages(messageIds)));

  UserEntityState changeProfileImageStatus(int userId,bool value)
    => UserEntityState(entities: updateOne(entities[userId]!.changeProfileImageStatus(value)));

  UserEntityState updateUserName(int userId,String userName)
    => UserEntityState(entities: updateOne(entities[userId]!.updateUserName(userName)));

  UserEntityState updateName(int userId,String name)
    => UserEntityState(entities: updateOne(entities[userId]!.updateName(name)));

  Iterable<UserState> getFollowers(int userId) => entities[userId]!.followers.ids.map((e) => entities[e]!);
  Iterable<UserState> getFolloweds(int userId) => entities[userId]!.followeds.ids.map((e) => entities[e]!);
}