import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

@immutable
class UserEntityState extends EntityState<UserState>{
  const UserEntityState({required super.entities});

  Iterable<UserState> getFollowers(int userId) => entities[userId]!.followers.ids.map((e) => entities[e]!);
  Iterable<UserState> getFolloweds(int userId) => entities[userId]!.followeds.ids.map((e) => entities[e]!);

  UserEntityState addUser(UserState value)
    => UserEntityState(entities: appendOne(value));
  UserEntityState addUsers(Iterable<UserState> values)
    => UserEntityState(entities: appendMany(values));
  
  UserEntityState addFollowers(int userId, Iterable<UserState> users)
    => UserEntityState(
        entities: appendManyAndUpdateOne(
          users,
          entities[userId]!.nexPageFollowers(users.map((e) => e.id))
        )
      );
  UserEntityState addFolloweds(int userId, Iterable<UserState> users)
    => UserEntityState(
        entities: appendManyAndUpdateOne(
          users,
          entities[userId]!.loadFolloweds(users.map((e) => e.id))
        )
      );
  UserEntityState addQuestion(int userId,int questionId)
    => UserEntityState(entities: updateOne(entities[userId]!.addQuestion(questionId)));
  UserEntityState addQuestions(int userId, Iterable<int> questions)
    => UserEntityState(entities: updateOne(entities[userId]!.loadQuestions(questions)));

  UserEntityState loadUserImage(int userId, Uint8List image)
    => UserEntityState(entities: updateOne(entities[userId]!.loadUserImage(image)));

  UserEntityState makeFollowRequest(int currentUserId, int userId)
    => UserEntityState(entities: updateMany([
        entities[userId]!.addRequester(currentUserId),
        entities[currentUserId]!.addRequested(entities[userId]!.profileVisibility,userId)
    ]));
  UserEntityState cancelFollowRequest(int currentId, int userId)
    => UserEntityState(entities: updateMany([
      entities[userId]!.removeRequester(currentId),
      entities[currentId]!.removeRequested(entities[userId]!.profileVisibility, userId)
    ]));

  UserEntityState nextPageUserMessages(int userId,Iterable<Message> messages)
    => UserEntityState(entities: updateOne(entities[userId]!.nextPageMessages(messages.length)));
}