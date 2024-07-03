import 'package:json_annotation/json_annotation.dart';
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
}