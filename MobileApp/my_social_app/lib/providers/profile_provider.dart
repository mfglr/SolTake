import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_social_app/constants/records_per_page.dart';
import 'package:my_social_app/models/states/user_state.dart';
import 'package:my_social_app/services/user_service.dart';

class ProfileProvider extends ChangeNotifier{
  final UserService _userService;
  
  ProfileProvider._(this._userService);
  static final ProfileProvider _singleton = ProfileProvider._(UserService());
  factory ProfileProvider() => _singleton;

  late UserState _user;
  UserState get user => _user;
  String get userName => _user.formatUserName();

  late List<UserState> _followers;
  List<UserState> get followers => _followers;
  String? _lastLoadedFollowerId;
  bool _isLastFollowers = false;
  Future<void> loadFollowers() async {
    if(!_isLastFollowers){
      _followers = await _userService.getFollowers(lastId: _lastLoadedFollowerId);
      _lastLoadedFollowerId = _followers.isNotEmpty ? _followers[_followers.length - 1].id : _lastLoadedFollowerId;
      _isLastFollowers = _followers.length < recordsPerPage;
      notifyListeners();
    }
  }

  late List<UserState> _followeds;
  List<UserState> get followeds => _followeds;
  String? _lastLoadedFollowedId;
  bool _isLastFolloweds = false;
  Future<void> loadFolloweds() async {
    if(!_isLastFolloweds){
      _followeds = await _userService.getFolloweds(lastId: _lastLoadedFollowedId);
      _lastLoadedFollowedId = _followeds.isNotEmpty ? _followeds[_followeds.length - 1].id : _lastLoadedFollowedId;
      _isLastFolloweds = _followeds.length < recordsPerPage;
      notifyListeners();
    }
  }

  bool _isInitiliazed = false;
  Future<void> init() async {
    if(!_isInitiliazed){
      _user = (await _userService.get()).toUserState();
      _isInitiliazed = true;
      notifyListeners();
    }
  }
}