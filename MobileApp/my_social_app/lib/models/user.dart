import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/ids.dart';
import 'package:my_social_app/state/user_entity_state/gender.dart';
import 'package:my_social_app/state/user_entity_state/profilevisibility.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
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
  final int numberOfUnviewedNotifications;
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
    this.numberOfUnviewedNotifications,
    this.isFollower,
    this.isFollowed,
    this.isRequester,
    this.isRequested
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  UserState toUserState()
    => UserState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userName: userName,
        name: name,
        birthDate: birthDate,
        gender: Gender.values[gender],
        profileVisibility: ProfileVisibility.values[profileVisibility],
        numberOfQuestions: numberOfQuestions,
        numberOfFollowers: numberOfFollowers,
        numberOfFolloweds: numberOfFolloweds,
        isFollower: isFollower,
        isFollowed: isFollowed,
        isRequester: isRequester,
        isRequested: isRequested,
        followers: const Ids(recordsPerPage: 20, ids: [], isLast: false, lastValue: null),
        followeds: const Ids(recordsPerPage: 20, ids: [], isLast: false, lastValue: null),
        requesters: const Ids(recordsPerPage: 20, ids: [], isLast: false, lastValue: null),
        requesteds: const Ids(recordsPerPage: 20, ids: [], isLast: false, lastValue: null),
        questions: const Ids(recordsPerPage: 20, ids: [], isLast: false, lastValue: null),
      );
}
