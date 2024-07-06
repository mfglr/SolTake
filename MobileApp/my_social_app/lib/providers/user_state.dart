import 'dart:collection';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/records_per_page.dart';
import 'package:my_social_app/models/user.dart';

@JsonSerializable()
class UserState{
  final String _id;
  String get id => _id;
  final DateTime _createdAt;
  DateTime get createdAt => _createdAt;
  final DateTime? _updatedDAt;
  DateTime? get updatedDAt => _updatedDAt;
  
  String _userName;
  String get userName => _userName;

  String? _name;
  String? get name => _name;
  
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;

  int _profileVisibility;
  int get profileVisibility => _profileVisibility;

  int _gender;
  int get gender => _gender;

  int _numberOfPosts;
  int get numberOfPosts => _numberOfPosts;

  int _numberOfFollowers;
  int get numberOfFollowers => _numberOfFollowers;

  int _numberOfFolloweds;
  int get numberOfFolloweds => _numberOfFolloweds;

  bool _isFollower;
  bool get isFollower => _isFollower;

  bool _isFollowed;
  bool get isFollowed => _isFollowed;

  bool _isRequester;
  bool get isRequester => _isRequester;

  bool _isRequested;
  bool get isRequested => _isRequested;

  UserState(
    this._id,
    this._createdAt,
    this._updatedDAt,
    this._userName,
    this._name,
    this._gender,
    this._birthDate,
    this._profileVisibility,
    this._numberOfPosts,
    this._numberOfFollowers,
    this._numberOfFolloweds,
    this._isFollower,
    this._isFollowed,
    this._isRequester,
    this._isRequested
  );

  UserState _clone(){
    UserState s = UserState(
      id,
      createdAt,
      updatedDAt, 
      userName,
      name,
      gender,
      birthDate,
      profileVisibility,
      numberOfPosts,
      numberOfFollowers,
      numberOfFolloweds,
      isFollower,
      isFollowed,
      isRequester,
      isRequested
    );

    s._isLastFollowers = _isLastFollowers;
    s._lastFollower = _lastFollower;
    s._followers.addAll(_followers);

    s._isLastFolloweds = _isLastFolloweds;
    s._lastFollowed = _lastFollowed;
    s._followeds.addAll(_followeds);

    s._isLastRequesters = _isLastRequesters;
    s._lastRequester = _lastRequester;
    s._requesters.addAll(_requesters);
    
    s._isLastRequesteds = _isLastRequesteds;
    s._lastRequested = _lastRequested;
    s._requesteds.addAll(_requesteds);
    
    return s;
  }

  String formatUserName(int size) => userName.length <= size ? userName : "${userName.substring(0,size)}...";
  String formatName(int size){
    if(name == null) return formatUserName(size);
    return name!.length <= size ? name! : "${name!.substring(0,size)}...";
  }

  String? _lastFollower;
  String? get lastFollower => _lastFollower;
  bool _isLastFollowers = false;
  bool get isLastFollowers => _isLastFollowers;
  final List<String> _followers = [];

  String? _lastFollowed;
  String? get lastFollowed => _lastFollowed;
  bool _isLastFolloweds = false;
  bool get isLastFolloweds => _isLastFolloweds;
  final List<String> _followeds = [];

  String? _lastRequester;
  String? get lastRequester => _lastRequester;
  bool _isLastRequesters = false;
  bool get isLastRequesters => _isLastRequesters;
  final List<String> _requesters = [];

  String? _lastRequested;
  String? get lastRequested => _lastRequested;
  bool _isLastRequesteds = false;
  bool get isLastRequesteds => _isLastRequesteds;
  final List<String> _requesteds = [];

  UnmodifiableListView<String> get followers => UnmodifiableListView(_followers);
  UnmodifiableListView<String> get followeds => UnmodifiableListView(_followeds);
  UnmodifiableListView<String> get requesters => UnmodifiableListView(_requesters);
  UnmodifiableListView<String> get requesteds => UnmodifiableListView(_requesteds);
  
  UserState loadFollowers(List<String> followers){
    final clone = _clone();
    clone._lastFollower = followers.isNotEmpty ? followers[followers.length - 1] : clone._lastFollower;
    clone._isLastFollowers = followers.length < recordsPerPage;
    clone._followers.addAll(followers);
    return clone;
  }
  UserState loadFolloweds(List<String> followeds){
    final clone = _clone();
    clone._lastFollowed = followeds.isNotEmpty ? followeds[followeds.length - 1] : clone._lastFollowed;
    clone._isLastFolloweds = followeds.length < recordsPerPage;
    clone._followeds.addAll(followeds);
    return clone;
  }
  UserState loadRequesters(List<String> users){
    final clone = _clone();
    clone._lastRequester = users.isNotEmpty ? users[users.length - 1] : clone._lastRequester;
    clone._isLastRequesters = users.length < recordsPerPage;
    clone._requesters.addAll(users);
    return clone;
  }
  UserState loadRequesteds(List<String> users){
    final clone = _clone();
    clone._lastRequested = users.isNotEmpty ? users[users.length - 1] : clone._lastRequested;
    clone._isLastRequesteds = users.length < recordsPerPage;
    clone._requesteds.addAll(users);
    return clone;
  }

  UserState addRequester(String requesterId){
    final clone = _clone();
    if(clone.profileVisibility == ProfileVisibility.private){
      clone._requesters.add(requesterId);
    }
    else{
      clone._isFollowed = true;
      clone._numberOfFollowers = clone._numberOfFollowers + 1;
      clone._followers.add(requesterId);
    }
    return clone;
  }
  UserState addRequested(String requestedId){
    final clone = _clone();
    if(clone.profileVisibility == ProfileVisibility.private){
      clone._requesteds.add(requestedId);
    }
    else{
      clone._numberOfFolloweds = clone._numberOfFolloweds + 1;
      clone._followeds.add(requestedId);
    }
    return clone;
  }
  UserState removeRequester(String requesterId){
    final clone = _clone();
    clone._isFollowed = false;
    clone._isRequested = false;
    clone._numberOfFollowers = clone.numberOfFollowers - 1;
    clone._requesters.removeWhere((id) => id == requesterId);
    clone._followers.removeWhere((id) => id == requesterId);
    return clone;
  }
  UserState removeRequested(String requestedId){
    final clone = _clone();
    clone._numberOfFolloweds = clone._numberOfFolloweds - 1;
    clone._followeds.removeWhere((id) => id == requestedId);
    clone._requesteds.removeWhere((id) => id == requestedId);
    return clone;
  }
  UserState removeFollower(String requesterId){
    final clone = _clone();
    clone._numberOfFollowers = clone.numberOfFollowers - 1;
    clone._followers.removeWhere((id) => id == requesterId);
    return clone;
  }
  UserState removeFollowed(String  requestedId){
    final clone = _clone();
    clone._isFollower = false;
    clone._numberOfFolloweds = clone.numberOfFolloweds - 1;
    clone._followeds.removeWhere((id) => id == requestedId);
    return clone;
  }
}
