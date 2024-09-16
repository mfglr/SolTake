import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';

@immutable
class UserEntityState extends EntityState<UserState>{
  const UserEntityState({required super.entities});

  UserEntityState addUser(UserState value)
    => UserEntityState(entities: appendOne(value));
  UserEntityState addUsers(Iterable<UserState> values)
    => UserEntityState(entities: appendMany(values));

  UserEntityState follow(int currentUserId, int followedId, int followId) =>
    UserEntityState(entities: updateMany([
      entities[currentUserId]?.addFollowedToCurrentUser(followId),
      entities[followedId]?.addFollower(followId)
    ]));
  UserEntityState unfollow(int currentUserId, int followedId, int followId) =>
    UserEntityState(entities: updateMany([
      entities[currentUserId]?.removeFollowedToCurrentUser(followId),
      entities[followedId]?.removeFollower(followId)
    ]));
  UserEntityState removeFollower(int currentUserId,int followerId, int followId) =>
    UserEntityState(entities: updateMany([
      entities[currentUserId]?.removeFollowerToCurrentUser(followId),
      entities[followerId]?.removeFollowed(followId)
    ]));
  UserEntityState addNewFollower(int currentUserId,int followerId,int followId) =>
    UserEntityState(entities: updateMany([
      entities[currentUserId]?.addFollowerToCurrentUser(followId),
      entities[followerId]?.addFollowed(followId)
    ]));

  //followers
  UserEntityState getNextPageFollowers(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageFollowers()));
  UserEntityState addNextPageFollowers(int userId, Iterable<int> followIds)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageFollowers(followIds)));

  //foloweds
  UserEntityState getNextPageFolloweds(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageFolloweds()));
  UserEntityState addNextPageFolloweds(int userId, Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageFolloweds(ids)));

  //not followeds
  UserEntityState getNextPageNotFolloweds(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageNotFolloweds()));
  UserEntityState addNextPageNotFolloweds(int userId,Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageNotFolloweds(ids)));
  UserEntityState addNotFollowed(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.addNotFollowed(id)));
  UserEntityState removeNotFollowed(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.removeNotFollowed(id)));

  //
  UserEntityState markQuestionAsSolved(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.markQuestionAsSolved(id)));
  UserEntityState markQuestionAsUnsolved(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.markQuestionAsUnsolved(id)));

  //questions
  UserEntityState getNextPageQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageQuestions()));
  UserEntityState addNextPageQuestions(int userId, Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageQuestions(ids)));
  UserEntityState addNewQuestion(int userId,int id)
    => UserEntityState(entities: updateOne(entities[userId]?.addNewQuestion(id)));
  UserEntityState removeQuestion(int userId,int questionId)
    => UserEntityState(entities: updateOne(entities[userId]?.removeQuestion(questionId)));

  //solved questions
  UserEntityState getNextPageSolvedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageSolvedQuestions()));
  UserEntityState addNextPageSolvedQuestions(int userId, Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageSolvedQuestions(ids)));
  
  //unsolved questions
  UserEntityState getNextPageUnsolvedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageUnsolvedQuestions()));
  UserEntityState addNextPageUnsolvedQuestions(int userId,Iterable<int> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageUnsolvedQuestions(ids)));
  

  //messages
  UserEntityState getNextPageMessages(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.nextPageMessages()));
  UserEntityState addNextPageMessages(int userId,Iterable<int> messageIds)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageMessages(messageIds)));
  UserEntityState addMessage(int userId,int messageId)
    => UserEntityState(entities: updateOne(entities[userId]?.addMessage(messageId)));
  UserEntityState removeMessage(int userId,int messageId)
    => UserEntityState(entities: updateOne(entities[userId]?.removeMessage(messageId)));
  UserEntityState removeMessages(int userId,Iterable<int> messageIds)
    => UserEntityState(entities: updateOne(entities[userId]?.removeMessages(messageIds)));


  UserEntityState changeProfileImageStatus(int userId,bool value)
    => UserEntityState(entities: updateOne(entities[userId]?.changeProfileImageStatus(value)));
  UserEntityState updateUserName(int userId,String userName)
    => UserEntityState(entities: updateOne(entities[userId]?.updateUserName(userName)));
  UserEntityState updateName(int userId,String name)
    => UserEntityState(entities: updateOne(entities[userId]?.updateName(name)));
  UserEntityState updateBiography(int userId,String biography)
    => UserEntityState(entities: updateOne(entities[userId]?.updateBiography(biography)));
}