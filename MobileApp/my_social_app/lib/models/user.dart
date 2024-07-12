import 'package:json_annotation/json_annotation.dart';
part "user.g.dart";

@JsonSerializable()
class User{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userName;
  final String? name;
  final DateTime? birthDate;
  final int gender;
  final int profileVisibility;
  final int numberOfQuestions;
  final int numberOfFollowers;
  final int numberOfFolloweds;
  final bool isFollower;
  final bool isFollowed;
  final bool isRequester;
  final bool isRequested;

  const User(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userName,
    this.name,
    this.gender,
    this.birthDate,
    this.profileVisibility,
    this.numberOfQuestions,
    this.numberOfFollowers,
    this.numberOfFolloweds,
    this.isFollower,
    this.isFollowed,
    this.isRequester,
    this.isRequested
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
