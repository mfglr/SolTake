import 'dart:collection';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/records_per_page.dart';
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

  String formatUserName() => userName.length <= 10 ? userName : "${userName.substring(0,10)}...";
  String? formatName(){
    if(name == null) return name;
    return name!.length <= 20 ? name : "${name!.substring(0,20)}...";
  }

  String? _lastFollowerId;
  String? get lastFollowerId => _lastFollowerId;
  bool _isLastFollower = false;
  bool get isLastFollower => _isLastFollower;
  final List<FollowState> _followers = [];
  UnmodifiableListView<FollowState> get followers => UnmodifiableListView(_followers);
  void loadFollowers(List<String> users){
    _lastFollowerId = users.isNotEmpty ? users[users.length - 1] : _lastFollowerId;
    _isLastFollower = users.length < recordsPerPage;
    _followers.addAll(users.map((x) => FollowState(x, id)));
  }

  String? _lastFollowedId;
  String? get lastFollowedId => _lastFollowedId;
  bool _isLastFollowed = false;
  bool get isLastFollowed => _isLastFollowed;
  final List<FollowState> _followeds = [];
  UnmodifiableListView<FollowState> get followeds => UnmodifiableListView(_followeds);
   void loadFolloweds(List<String> users){
    _lastFollowedId = users.isNotEmpty ? users[users.length - 1] : _lastFollowedId;
    _isLastFollowed = users.length < recordsPerPage;
    _followeds.addAll(users.map((x) => FollowState(id, x)));
  }
}