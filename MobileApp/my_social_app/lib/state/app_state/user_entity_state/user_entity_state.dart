import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/entity_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/followed_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follower_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/pagination/id_state.dart';

@immutable
class UserEntityState extends EntityState<UserState>{
  const UserEntityState({required super.entities});

  UserEntityState addUser(UserState value)
    => UserEntityState(entities: appendOne(value));
  UserEntityState addUsers(Iterable<UserState> values)
    => UserEntityState(entities: appendMany(values));
  
  //followers
  UserEntityState getNextPageFollowers(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageFollowers()));
  UserEntityState addNextPageFollowers(int userId, Iterable<FollowerState> followers)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageFollowers(followers)));
  UserEntityState addFollower(int userId, FollowerState follower)
    => UserEntityState(entities: updateOne(entities[userId]?.addFollower(follower)));
  UserEntityState removeFollower(int userId, int followerId)
    => UserEntityState(entities: updateOne(entities[userId]?.removeFollower(followerId)));

  //foloweds
  UserEntityState getNextPageFolloweds(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageFolloweds()));
  UserEntityState addNextPageFolloweds(int userId, Iterable<FollowedState> followeds)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageFolloweds(followeds)));
  UserEntityState addFollowed(int userId,FollowedState followed)
    => UserEntityState(entities: updateOne(entities[userId]?.addFollowed(followed)));
  UserEntityState removeFollowed(int userId,int followedId)
    => UserEntityState(entities: updateOne(entities[userId]?.removeFollowed(followedId)));

  //not followeds
  UserEntityState getNextPageNotFolloweds(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageNotFolloweds()));
  UserEntityState addNextPageNotFolloweds(int userId,Iterable<IdState> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageNotFolloweds(ids)));
  UserEntityState addNotFollowed(int userId,IdState id)
    => UserEntityState(entities: updateOne(entities[userId]?.addNotFollowed(id)));
  UserEntityState removeNotFollowed(int userId,IdState id)
    => UserEntityState(entities: updateOne(entities[userId]?.removeNotFollowed(id)));

  //
  UserEntityState markQuestionAsSolved(int userId,IdState id)
    => UserEntityState(entities: updateOne(entities[userId]?.markQuestionAsSolved(id)));
  UserEntityState markQuestionAsUnsolved(int userId,IdState id)
    => UserEntityState(entities: updateOne(entities[userId]?.markQuestionAsUnsolved(id)));

  //questions
  UserEntityState getNextPageQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageQuestions()));
  UserEntityState addNextPageQuestions(int userId, Iterable<IdState> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageQuestions(ids)));
  UserEntityState addNewQuestion(int userId,IdState id)
    => UserEntityState(entities: updateOne(entities[userId]?.addNewQuestion(id)));
  
  //solved questions
  UserEntityState getNextPageSolvedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageSolvedQuestions()));
  UserEntityState addNextPageSolvedQuestions(int userId, Iterable<IdState> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageSolvedQuestions(ids)));
  
  //unsolved questions
  UserEntityState getNextPageUnsolvedQuestions(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.getNextPageUnsolvedQuestions()));
  UserEntityState addNextPageUnsolvedQuestions(int userId,Iterable<IdState> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageUnsolvedQuestions(ids)));
  

  //messages
  
  UserEntityState getNextPageMessages(int userId)
    => UserEntityState(entities: updateOne(entities[userId]?.nextPageMessages()));
  UserEntityState addNextPageMessages(int userId,Iterable<IdState> ids)
    => UserEntityState(entities: updateOne(entities[userId]?.addNextPageMessages(ids)));
  UserEntityState addMessage(int userId,IdState id)
    => UserEntityState(entities: updateOne(entities[userId]?.addMessage(id)));
  

  UserEntityState changeProfileImageStatus(int userId,bool value)
    => UserEntityState(entities: updateOne(entities[userId]!.changeProfileImageStatus(value)));

  UserEntityState updateUserName(int userId,String userName)
    => UserEntityState(entities: updateOne(entities[userId]!.updateUserName(userName)));

  UserEntityState updateName(int userId,String name)
    => UserEntityState(entities: updateOne(entities[userId]!.updateName(name)));

  Iterable<UserState> getFollowers(int userId) => entities[userId]!.followers.props.map((e) => entities[e.key]!);
  Iterable<UserState> getFolloweds(int userId) => entities[userId]!.followeds.props.map((e) => entities[e.key]!);
}