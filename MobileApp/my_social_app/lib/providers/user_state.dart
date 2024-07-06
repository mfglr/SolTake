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

  UserState clone(){
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
  
  void loadFollowers(List<UserState> followers){
    _lastFollower = followers.isNotEmpty ? followers[followers.length - 1].id : _lastFollower;
    _isLastFollowers = followers.length < recordsPerPage;
    _followers.addAll(followers.map((follower) => follower.id));
  }
  void loadFolloweds(List<UserState> followeds){
    _lastFollowed = followeds.isNotEmpty ? followeds[followeds.length - 1].id : _lastFollowed;
    _isLastFolloweds = followeds.length < recordsPerPage;
    _followeds.addAll(followeds.map((followed) => followed.id));
  }
  void loadRequesters(List<UserState> requesters){
    _lastRequester = requesters.isNotEmpty ? requesters[requesters.length - 1].id : _lastRequester;
    _isLastRequesters = requesters.length < recordsPerPage;
    _requesters.addAll(requesters.map((requester) => requester.id));
  }
  void loadRequesteds(List<UserState> requested){
    _lastRequested = requested.isNotEmpty ? requested[requested.length - 1].id : _lastRequested;
    _isLastRequesteds = requested.length < recordsPerPage;
    _requesteds.addAll(requested.map((requested) => requested.id));
  }

  void addRequester(UserState requester){
    if(profileVisibility == ProfileVisibility.private){
      _requesters.add(requester.id);
    }
    else{
      _isFollowed = true;
      _numberOfFollowers = _numberOfFollowers + 1;
      _followers.add(requester.id);
    }
  }
  void addRequested(UserState requested){
    if(profileVisibility == ProfileVisibility.private){
      _requesteds.add(requested.id);
    }
    else{
      _numberOfFolloweds = _numberOfFolloweds + 1;
      _followeds.add(requested.id);
    }
  }
  void removeRequester(UserState requester){
    _isFollowed = false;
    _isRequested = false;
    _numberOfFollowers = numberOfFollowers - 1;
    _requesters.removeWhere((id) => id == requester.id);
    _followers.removeWhere((id) => id == requester.id);
  }
  void removeRequested(UserState requested){
    _numberOfFolloweds = _numberOfFolloweds - 1;
    _followeds.removeWhere((id) => id == requested.id);
    _requesteds.removeWhere((id) => id == requested.id);
  }
  void removeFollower(UserState follower){
    _numberOfFollowers = numberOfFollowers - 1;
    _followers.removeWhere((id) => id == follower.id);
  }
  void removeFollowed(UserState followed){
    _isFollower = false;
    _numberOfFolloweds = numberOfFolloweds - 1;
    _followeds.removeWhere((id) => id == followed.id);
  }
}
