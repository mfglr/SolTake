import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:my_social_app/providers/account_provider.dart';
import 'package:my_social_app/providers/app_state.dart';
import 'package:my_social_app/providers/user_state.dart';
import 'package:my_social_app/services/user_service.dart';

class AppProvider extends ChangeNotifier{

  final UserService _userService;
  
  AppProvider._(this._userService);
  static final AppProvider _singleton = AppProvider._(UserService());
  factory AppProvider() => _singleton;

  AppState _state = AppState();

  String get key => _state.key;
  UserState? getUser(String id) => _state.getUser(id);
  UnmodifiableListView<UserState> getFollowers(String id) => _state.getFollowers(id);
  UnmodifiableListView<UserState> getFolloweds(String id) => _state.getFolloweds(id);
  UnmodifiableListView<UserState> getRequesters() => _state.getRequesters();
  UnmodifiableListView<UserState> getRequesteds() => _state.getRequesteds();
  UnmodifiableListView<UserState> get usersSearched => _state.usersSearched;

  Future<void> loadUser(String id) async {
    final user = _state.getUser(id);
    if(user == null){
      final state = (await _userService.getById(id)).toUserState();
      _state = _state.loadUser(state);
      notifyListeners();
    }
  }
  Future<void> loadFollowers(String id) async {
    final user = _state.getUser(id)!;
    if(!user.isLastFollowers){
      final followers = (await _userService.getFollowersById(id)).map((user) => user.toUserState());
      _state = _state.loadFollowers(id,followers.toList());
      notifyListeners();
    }
  }
  Future<void> loadFollowersIfNoUsers(String id) async {
    if(_state.getFollowers(id).isEmpty) await loadFollowers(id);
  }
  Future<void> loadFolloweds(String id) async {
    final user = _state.getUser(id)!;
    if(!user.isLastFolloweds){
      final followeds = (await _userService.getFollowedsById(id)).map((user) => user.toUserState());
      _state = _state.loadFolloweds(id,followeds.toList());
      notifyListeners();
    }
  }
  Future<void> loadFollowedsIfNoUsers(String id) async {
    if(_state.getFolloweds(id).isEmpty) await loadFolloweds(id);
  }
  Future<void> loadRequesters() async {
    final currentUser = _state.getUser(AccountProvider().state!.id)!;
    if(!currentUser.isLastRequesters){
      final requesters = (await _userService.getRequesters()).map((user) => user.toUserState());
      _state = _state.loadRequesters(requesters.toList());
      notifyListeners();
    }
  }
  Future<void> loadRequesteds() async {
    final currentUser = _state.getUser(AccountProvider().state!.id)!;
    if(!currentUser.isLastRequesteds){
      final requesteds = (await _userService.getRequesteds()).map((user) => user.toUserState());
      _state = _state.loadRequesteds(requesteds.toList());
      notifyListeners();
    }
  }
  Future<void> makeFollowRequest(String requestedId) async {
    await _userService.makeFollowRequest(requestedId);
    _state = _state.makeFollowRequest(requestedId);
    notifyListeners();
  }
  Future<void> cancelFollowRequest(String requestedId) async {
    await _userService.cancelFollowRequest(requestedId);
    _state = _state.cancelFollowRequest(requestedId);
    notifyListeners();
  }
  Future<void> removeFollower(String followerId) async {
    await _userService.removeFollower(followerId);
    _state = _state.removeFollower(followerId);
    notifyListeners();
  }

  Future<void> initSearch(String key) async {
    final users = (await _userService.search(key)).map((user) => user.toUserState());
    _state = _state.initSearch(key, users.toList());
    notifyListeners();
  }

  void clearSearch(){
    _state = _state.clearSearch();
    notifyListeners();
  }  
}