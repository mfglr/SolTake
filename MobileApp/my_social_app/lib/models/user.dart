import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
part "user.g.dart";

@immutable
@JsonSerializable()
class User{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userName;
  final String name;
  final String biography;
  final bool hasImage;
  final int numberOfQuestions;
  final int numberOfFollowers;
  final int numberOfFolloweds;
  final bool isFollower;
  final bool isFollowed;
  final int? paginationKey;
  final DateTime? paginationDate;

  const User({
    required this.id,
    required this.hasImage,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.name,
    required this.biography,
    required this.numberOfQuestions,
    required this.numberOfFollowers,
    required this.numberOfFolloweds,
    required this.isFollower,
    required this.isFollowed,
    required this.paginationKey,
    required this.paginationDate
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
        biography: biography,
        hasImage: hasImage,
        numberOfQuestions: numberOfQuestions,
        numberOfFollowers: numberOfFollowers,
        numberOfFolloweds: numberOfFolloweds,
        isFollower: isFollower,
        isFollowed: isFollowed,
        questions: Pagination.init(questionsPerPage,true),
        solvedQuestions: Pagination.init(questionsPerPage,true),
        unsolvedQuestions: Pagination.init(questionsPerPage,true),
        savedQuestions: Pagination.init(questionsPerPage, true),
        followers: Pagination.init(usersPerPage,true),
        followeds: Pagination.init(usersPerPage,true),
        notFolloweds: Pagination.init(usersPerPage,true),
        messages: Pagination.init(messagesPerPage,true),
      );
}
