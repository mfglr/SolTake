import 'dart:collection';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/records_per_page.dart';
import 'package:my_social_app/models/states/follow_request_state.dart';
import 'package:my_social_app/models/states/follow_state.dart';
part "user_state.g.dart";

@JsonSerializable()
class UserState{
  final String id;
  final DateTime createdAt;
  final DateTime? updatedDAt;
  String userName;
  String? name;
  DateTime? birthDate;
  int profileVisibility;
  int gender;
  int numberOfPosts;
  int numberOfFollowers;
  int numberOfFolloweds;
  bool isFollower;
  bool isFollowed;

  UserState(
    this.id,
    this.createdAt,
    this.updatedDAt,
    this.userName,
    this.name,
    this.gender,
    this.birthDate,
    this.profileVisibility,
    this.numberOfPosts,
    this.numberOfFollowers,
    this.numberOfFolloweds,
    this.isFollower,
    this.isFollowed
  );

  Map<String, dynamic> toJson() => _$UserStateToJson(this);
  factory UserState.fromJson(Map<String, dynamic> json) => _$UserStateFromJson(json);

  String formatUserName(int size) => userName.length <= size ? userName : "${userName.substring(0,size)}...";
  String formatName(int size){
    if(name == null) return formatUserName(size);
    return name!.length <= size ? name! : "${name!.substring(0,size)}...";
  }


  //following start
  String? _lastRequesterId;
  String? get lasRequesterId => _lastRequesterId;
  bool _isLastRequesterId = false;
  bool get isLastRequesterId => _isLastRequesterId;
  final List<FollowRequestState> _requesters = [];
  UnmodifiableListView<FollowRequestState> get requesters => UnmodifiableListView(_requesters);
  
  String? _lastRequestedId;
  String? get lasRequestedId => _lastRequestedId;
  bool _isLastRequestedId = false;
  bool get isLastRequestedId => _isLastRequestedId;
  final List<FollowRequestState> _requesteds = [];
  UnmodifiableListView<FollowRequestState> get requesteds => UnmodifiableListView(_requesteds);

  String? _lastFollowerId;
  String? get lastFollowerId => _lastFollowerId;
  bool _isLastFollower = false;
  bool get isLastFollower => _isLastFollower;
  final List<FollowState> _followers = [];
  UnmodifiableListView<FollowState> get followers => UnmodifiableListView(_followers);

  String? _lastFollowedId;
  String? get lastFollowedId => _lastFollowedId;
  bool _isLastFollowed = false;
  bool get isLastFollowed => _isLastFollowed;
  final List<FollowState> _followeds = [];
  UnmodifiableListView<FollowState> get followeds => UnmodifiableListView(_followeds);
  
  void loadRequesters(List<String> users) {
    _lastRequesterId = users.isNotEmpty ? users[users.length - 1] : _lastRequesterId;
    _isLastRequesterId = users.length < recordsPerPage;
    _requesters.addAll(users.map((x) => FollowRequestState(x, id)));
  }

   void loadRequesteds(List<String> users) {
    _lastRequestedId = users.isNotEmpty ? users[users.length - 1] : _lastRequestedId;
    _isLastRequestedId = users.length < recordsPerPage;
    _requesters.addAll(users.map((x) => FollowRequestState(id, x)));
  }
  
  void loadFollowers(List<String> users){
    _lastFollowerId = users.isNotEmpty ? users[users.length - 1] : _lastFollowerId;
    _isLastFollower = users.length < recordsPerPage;
    _followers.addAll(users.map((x) => FollowState(x, id)));
  }
  void loadFolloweds(List<String> users){
    _lastFollowedId = users.isNotEmpty ? users[users.length - 1] : _lastFollowedId;
    _isLastFollowed = users.length < recordsPerPage;
    _followeds.addAll(users.map((x) => FollowState(id, x)));
  }
  void follow(String followerId){
    isFollowed = true;
    _followeds.add(FollowState(followerId, id));
  }
  void unfollow(String followerId){
    isFollowed = false;
    _followeds.removeWhere((x) => x.followerId == followerId);
  }
}