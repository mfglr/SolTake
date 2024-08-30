import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';

@immutable
class UserEntityState extends EntityState<UserState>{
  const UserEntityState({required super.containers});

  UserEntityState addUser(UserState value)
    => UserEntityState(containers: appendOne(value));
  UserEntityState addUsers(Iterable<UserState> values)
    => UserEntityState(containers: appendMany(values));
  
  //followers
  UserEntityState getNextPageFollowers(int userId)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.getNextPageFollowers()));
  UserEntityState addNextPageFollowers(int userId, Iterable<int> followIds)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addNextPageFollowers(followIds)));
  UserEntityState addFollower(int userId, int followId)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addFollower(followId)));
  UserEntityState removeFollower(int userId, int followId)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.removeFollower(followId)));

  //foloweds
  UserEntityState getNextPageFolloweds(int userId)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.getNextPageFolloweds()));
  UserEntityState addNextPageFolloweds(int userId, Iterable<int> ids)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addNextPageFolloweds(ids)));
  UserEntityState addFollowed(int userId,int id)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addFollowed(id)));
  UserEntityState removeFollowed(int userId,int id)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.removeFollowed(id)));

  //not followeds
  UserEntityState getNextPageNotFolloweds(int userId)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.getNextPageNotFolloweds()));
  UserEntityState addNextPageNotFolloweds(int userId,Iterable<int> ids)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addNextPageNotFolloweds(ids)));
  UserEntityState addNotFollowed(int userId,int id)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addNotFollowed(id)));
  UserEntityState removeNotFollowed(int userId,int id)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.removeNotFollowed(id)));

  //
  UserEntityState markQuestionAsSolved(int userId,int id)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.markQuestionAsSolved(id)));
  UserEntityState markQuestionAsUnsolved(int userId,int id)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.markQuestionAsUnsolved(id)));

  //questions
  UserEntityState getNextPageQuestions(int userId)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.getNextPageQuestions()));
  UserEntityState addNextPageQuestions(int userId, Iterable<int> ids)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addNextPageQuestions(ids)));
  UserEntityState addNewQuestion(int userId,int id)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addNewQuestion(id)));
  
  //solved questions
  UserEntityState getNextPageSolvedQuestions(int userId)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.getNextPageSolvedQuestions()));
  UserEntityState addNextPageSolvedQuestions(int userId, Iterable<int> ids)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addNextPageSolvedQuestions(ids)));
  
  //unsolved questions
  UserEntityState getNextPageUnsolvedQuestions(int userId)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.getNextPageUnsolvedQuestions()));
  UserEntityState addNextPageUnsolvedQuestions(int userId,Iterable<int> ids)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addNextPageUnsolvedQuestions(ids)));
  

  //messages
  UserEntityState getNextPageMessages(int userId)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.nextPageMessages()));
  UserEntityState addNextPageMessages(int userId,Iterable<int> ids)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addNextPageMessages(ids)));
  UserEntityState addMessage(int userId,int id)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.addMessage(id)));
  

  UserEntityState changeProfileImageStatus(int userId,bool value)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.changeProfileImageStatus(value)));

  UserEntityState updateUserName(int userId,String userName)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.updateUserName(userName)));

  UserEntityState updateName(int userId,String name)
    => UserEntityState(containers: updateOne(containers[userId]?.entity.updateName(name)));
}