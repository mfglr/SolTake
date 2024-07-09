import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:my_social_app/providers/account_provider.dart';
import 'package:my_social_app/providers/states/account_state.dart';
import 'package:my_social_app/providers/states/app_state.dart';
import 'package:my_social_app/providers/states/user_state.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/storages/account_secure_storage.dart';
import 'package:my_social_app/storages/base_account_storage.dart';

class AppProvider extends ChangeNotifier{

  AppProvider._(this._userService,this._storage,this._accountService);
  static final AppProvider _singleton = AppProvider._(UserService(),AccountSecureStorage(),AccountService());
  factory AppProvider() => _singleton;

  //services
  final UserService _userService;
  final AccountService _accountService;
  final BaseAccountStorage _storage;
  //*************************************************************************************************
  
  //Store
  AppState _state = AppState();
  //*************************************************************************************************

  //*************************************************************************************************
  //Selectors;
  //Account selector;
  AccountState? get accountState => _state.accountState;
  //**********************************************************************
  
  //Users Selectors;
  UserState? getUser(int id) => _state.getUser(id);
  UnmodifiableListView<UserState> getFollowers(int id) => _state.getFollowers(id);
  UnmodifiableListView<UserState> getFolloweds(int id) => _state.getFolloweds(id);
  UnmodifiableListView<UserState> getRequesters() => _state.getRequesters();
  UnmodifiableListView<UserState> getRequesteds() => _state.getRequesteds();
  //**********************************************************************

  //Search Selectors;
  String get key => _state.key;
  UnmodifiableListView<UserState> get usersSearched => _state.usersSearched;
  //**********************************************************************
  //*************************************************************************************************

  Future<void> initAccount() async{
    AccountState? state = await _storage.get();
    if(state != null){
      final account = await _accountService.loginByReshtoken(state.id, state.refreshToken);
      final newState = account.toAccountState();
      _state = _state.updateAccountState(newState);
      await _storage.set(newState);
    }
  }
  
  Future<void> loadUser(int id) async {
    final user = _state.getUser(id);
    if(user == null){
      final state = (await _userService.getById(id)).toUserState();
      _state = _state.loadUser(state);
      notifyListeners();
    }
  }
  Future<void> loadFollowers(int id) async {
    final user = _state.getUser(id)!;
    if(!user.isLastFollowers){
      final followers = (await _userService.getFollowersById(id)).map((user) => user.toUserState());
      _state = _state.loadFollowers(id,followers.toList());
      notifyListeners();
    }
  }
  Future<void> loadFollowersIfNoUsers(int id) async {
    if(_state.getFollowers(id).isEmpty) await loadFollowers(id);
  }
  Future<void> loadFolloweds(int id) async {
    final user = _state.getUser(id)!;
    if(!user.isLastFolloweds){
      final followeds = (await _userService.getFollowedsById(id)).map((user) => user.toUserState());
      _state = _state.loadFolloweds(id,followeds.toList());
      notifyListeners();
    }
  }
  Future<void> loadFollowedsIfNoUsers(int id) async {
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
  Future<void> makeFollowRequest(int requestedId) async {
    await _userService.makeFollowRequest(requestedId);
    _state = _state.makeFollowRequest(requestedId);
    notifyListeners();
  }
  Future<void> cancelFollowRequest(int requestedId) async {
    await _userService.cancelFollowRequest(requestedId);
    _state = _state.cancelFollowRequest(requestedId);
    notifyListeners();
  }
  Future<void> removeFollower(int followerId) async {
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