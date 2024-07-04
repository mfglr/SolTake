import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/records_per_page.dart';
import 'package:my_social_app/models/states/user_state.dart';
import 'package:my_social_app/providers/account_provider.dart';
import 'package:my_social_app/services/user_service.dart';

class UserProvider extends ChangeNotifier{
  
  final UserService _userService;
  UserProvider._(this._userService);
  static final UserProvider _singleton = UserProvider._(UserService());
  factory UserProvider() => _singleton;

  final Map<String,UserState> _users = {};
  UserState? getUser(String id) => _users[id];
  
  UserState? getCurrentUser(){
    final accountId = AccountProvider().state?.id;
    if(accountId == null) return null;
    return _users[accountId];
  }
  UnmodifiableListView<UserState> getFollowersById(String id) =>
    UnmodifiableListView(_users.values.where((user) => _users[id]!.followers.any((f) => f.followerId == user.id)));
  UnmodifiableListView<UserState> getFollowedsById(String id) =>
    UnmodifiableListView(_users.values.where((user) => _users[id]!.followeds.any((f) => f.followedId == user.id)));

  Future<void> follow(String followedId) async {
    await _userService.makeFollowRequest(followedId);
    final user = _users[followedId]!;
    user.follow(AccountProvider().state!.id);
    notifyListeners();
  }
  Future<void> unfollow(String followedId) async {
    final user = _users[followedId]!;
    user.unfollow(AccountProvider().state!.id);
    notifyListeners();
  }

  Future<void> loadUserById(String id) async {
    if(_users[id] == null){
      final user = (await _userService.getById(id)).toUserState();
      _users.addEntries([MapEntry(id, user)]);
      notifyListeners();
    }
  }
  Future<void> loadFollowersById(String id) async {
    final user = _users[id]!;
    if(!user.isLastFollower){
      final users = await _userService.getFollowersById(id, lastId: user.lastFollowerId);
      final states = users.map((x) => x.toUserState()).toList();
      user.loadFollowers(states.map((x) => x.id).toList());
      _users.addEntries(states.where((x) => _users[x.id] == null).map((x) => MapEntry(x.id,x)));
      notifyListeners();
    }
  }
  Future<void> loadFollowedsById(String id) async {
    final user = _users[id]!;
    if(!user.isLastFollowed){
      final users = await _userService.getFollowedsById(id,lastId: user.lastFollowedId);
      final states = users.map((x) => x.toUserState()).toList();
      user.loadFolloweds(states.map((x) => x.id).toList());
      _users.addEntries(states.where((x) => _users[x.id] == null).map((x) => MapEntry(x.id,x)));
      notifyListeners();
    }
  }
  Future<void> loadFollowersByIdIfNoUsers(String id) async {
    final users = getFollowersById(id);
    if(users.length < recordsPerPage) await loadFollowersById(id);
  }
  Future<void> loadFollowedsByIdIfNoUsers(String id) async {
    final users = getFollowedsById(id);
    if(users.length < recordsPerPage) await loadFollowedsById(id);
  }
}