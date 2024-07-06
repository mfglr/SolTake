import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/providers/user_state.dart';
part "user.g.dart";

@JsonSerializable()
class User{
  final String id;
  final DateTime createdAt;
  final DateTime? updatedDAt;
  final String userName;
  final String? name;
  final DateTime? birthDate;
  final int gender;
  final int profileVisibility;
  final int numberOfPosts;
  final int numberOfFollowers;
  final int numberOfFolloweds;
  final bool isFollower;
  final bool isFollowed;
  final bool isRequester;
  final bool isRequested;

  const User(
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
    this.isFollowed,
    this.isRequester,
    this.isRequested
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  UserState toUserState() => UserState(
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
}

class Gender{
  static const int def = 0;
  static const int male = 1;
  static const int female = 2;
}

class ProfileVisibility{
  static const int private = 0;
  static const int public = 1;
}