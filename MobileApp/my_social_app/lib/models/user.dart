import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/ids.dart';
import 'package:my_social_app/state/pagination.dart';
import 'package:my_social_app/state/user_entity_state/gender.dart';
import 'package:my_social_app/state/user_entity_state/profilevisibility.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
part "user.g.dart";

@immutable
@JsonSerializable()
class User{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userName;
  final String? name;
  final bool hasImage;
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

  const User({
    required this.id,
    required this.hasImage,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.profileVisibility,
    required this.numberOfQuestions,
    required this.numberOfFollowers,
    required this.numberOfFolloweds,
    required this.numberOfUnviewedNotifications,
    required this.isFollower,
    required this.isFollowed,
    required this.isRequester,
    required this.isRequested,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  UserState toUserState()
    => UserState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userName: userName,
        name: name,
        hasImage: hasImage,
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
        questions: Pagination.init(questionsPerPage),
        followers: Pagination.init(usersPerPage),
        followeds: Pagination.init(usersPerPage),
        requesters: const Ids(recordsPerPage: 20, ids: [], isLast: false, lastValue: null),
        requesteds: const Ids(recordsPerPage: 20, ids: [], isLast: false, lastValue: null),
        messages: Pagination.init(messagesPerPage),
      );
}
