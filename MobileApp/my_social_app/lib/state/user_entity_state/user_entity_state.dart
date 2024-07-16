import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

@immutable
class UserEntityState{
  final Map<int,UserState> users;
  const UserEntityState({required this.users});

  List<UserState> getFollowers(int userId) => users[userId]!.followers.ids.map((e) => users[e]!).toList();
  List<UserState> getFolloweds(int userId) => users[userId]!.followeds.ids.map((e) => users[e]!).toList();


  UserEntityState loadUser(UserState user){
    final Map<int,UserState> clone = {};
    clone.addAll(users);
    clone[user.id] = user;
    return UserEntityState(users: clone);
  }

  UserEntityState loadUsers(List<UserState> newUsers){
    final Map<int,UserState> clone = {};
    final uniqUsers = newUsers.where((user) => users[user.id] == null);
    clone.addAll(users);
    clone.addEntries(uniqUsers.map((e) => MapEntry(e.id, e)));
    return UserEntityState(users: clone);
  }

  UserEntityState loadFollowers(int userId, List<UserState> newUsers){
    final Map<int,UserState> clone = {};
    final uniqUsers = newUsers.where((user) => users[user.id] == null);
    clone.addAll(users);
    clone.addEntries(uniqUsers.map((e) => MapEntry(e.id, e)));
    clone[userId] = clone[userId]!.loadFollowers(newUsers.map((e) => e.id).toList());
    return UserEntityState(users: clone);
  }

  UserEntityState loadFolloweds(int userId, List<UserState> newUsers){
    final Map<int,UserState> clone = {};
    final uniqUsers = newUsers.where((user) => users[user.id] == null);
    clone.addAll(users);
    clone.addEntries(uniqUsers.map((e) => MapEntry(e.id, e)));
    clone[userId] = clone[userId]!.loadFolloweds(newUsers.map((e) => e.id).toList());
    return UserEntityState(users: clone);
  }

  UserEntityState loadQuestions(int userId, List<int> questions){
    final Map<int,UserState> clone = {};
    clone.addAll(users);
    clone[userId] = clone[userId]!.loadQuestions(questions);
    return UserEntityState(users: clone);
  }

  UserEntityState startLoadingUserImage(int userId){
    final Map<int,UserState> clone = {};
    clone.addAll(users);
    clone[userId] = clone[userId]!.startLoadingUserImage();
    return UserEntityState(users: clone);
  }
  UserEntityState loadUserImage(int userId, Uint8List image){
    final Map<int,UserState> clone = {};
    clone.addAll(users);
    clone[userId] = clone[userId]!.loadUserImage(image);
    return UserEntityState(users: clone);
  }

  UserEntityState makeFollowRequest(int currentUserId, int userId){
    final Map<int,UserState> clone = {};
    clone.addAll(users);
    clone[userId] = clone[userId]!.addRequester(currentUserId);
    clone[currentUserId] = clone[currentUserId]!.addRequested(clone[userId]!.profileVisibility,userId);
    return UserEntityState(users: clone);
  }

  UserEntityState cancelFollowRequest(int currentId, int userId){
    final Map<int,UserState> clone = {};
    clone.addAll(users);
    clone[userId] = clone[userId]!.removeRequester(currentId);
    clone[currentId] = clone[currentId]!.removeRequested(clone[userId]!.profileVisibility, userId);
    return UserEntityState(users: clone);
  }


  //Questions
  UserEntityState addQuestion(int currentUserId,int questionId){
    final Map<int,UserState> clone = {};
    clone.addAll(users);
    clone[currentUserId] = clone[currentUserId]!.addQuestion(questionId);
    return UserEntityState(users: clone);
  }
}