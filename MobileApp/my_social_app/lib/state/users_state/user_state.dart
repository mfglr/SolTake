import 'package:flutter/material.dart';
import 'package:my_social_app/packages/media/models/multimedia.dart';
import 'package:my_social_app/state/avatar.dart';
import 'package:my_social_app/state/follows_state/follow_state.dart';
import 'package:my_social_app/state/users_state/user_story_state.dart';
import 'package:my_social_app/packages/entity_state/entity.dart';

@immutable
class UserState extends Entity<int> implements Avatar{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userName;
  final String? name;
  final String? biography;
  final int numberOfQuestions;
  final int numberOfFollowers;
  final int numberOfFolloweds;
  final bool isFollower;
  final bool isFollowed;
  final Multimedia? image;
  final Iterable<UserStoryState> stories;

  @override
  Multimedia? get avatar => image;
  @override
  int get avatarId => id;

  String formatName(int count){
    final r = (name ?? userName);
    return r.length <= count ? r : "${r.substring(0,count)}...";
  }

  String formatUserName({int count = 15}){
    return userName.length <= count ? userName : "${userName.substring(0,count)}...";
  }

  UserState({
    required super.id,
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
    required this.image,
    required this.stories
  });

  UserState _optional({
    DateTime? newUpdatedDate,
    String? newUserName,
    String? newName,
    String? newBiography,
    int? newNumberOfQuestions,
    int? newNumberOfFollowers,
    int? newNumberOfFolloweds,
    bool? newIsFollower,
    bool? newIsFollowed,
    Multimedia? newImage,
  }) => UserState(
    id: id,
    createdAt: createdAt,
    updatedAt: newUpdatedDate ?? updatedAt,
    userName: newUserName ?? userName,
    name: newName ?? name,
    biography: newBiography ?? biography,
    numberOfQuestions: newNumberOfQuestions ?? numberOfQuestions,
    numberOfFollowers: newNumberOfFollowers ?? numberOfFollowers,
    numberOfFolloweds: newNumberOfFolloweds ?? numberOfFolloweds,
    isFollower: newIsFollower ?? isFollower,
    isFollowed: newIsFollowed ?? isFollowed,
    image: newImage ?? image,
    stories: stories,
  );

  FollowState toFollower(int id) => 
    FollowState(
      id: id,
      userId: this.id,
      userName: userName,
      name: name,
      image: image,
      isFollower: true,
      isFollowed: isFollowed
    );
  FollowState toFollowed(int id) => 
    FollowState(
      id: id,
      userId: this.id,
      userName: userName,
      name: name,
      image: image,
      isFollower: isFollower,
      isFollowed: true
    );

  UserState follow() => _optional(
    newIsFollowed: true,
    newNumberOfFollowers: numberOfFollowers + 1
  );
  UserState increaseNumberFolloweds() => _optional(
    newNumberOfFolloweds: numberOfFolloweds + 1
  );

  UserState unfollow() => _optional(
    newIsFollowed: false,
    newNumberOfFollowers: numberOfFollowers - 1
  );
  UserState decreaseNumberFolloweds() => _optional(
    newNumberOfFolloweds: numberOfFolloweds - 1
  );

  //questions
  UserState createQuestion() => _optional(newNumberOfQuestions: numberOfQuestions + 1);
  UserState deleteQuestion() => _optional(newNumberOfQuestions: numberOfQuestions - 1);
  //questions

  UserState updateUserName(String userName) => 
    _optional(
      newUserName: userName,
      newUpdatedDate: DateTime.now()
    );
  UserState updateName(String name) =>
    _optional(
      newName: name,
      newUpdatedDate: DateTime.now()
    );
  UserState updateBiography(String biography) =>
    _optional(
      newBiography: biography,
      newUpdatedDate: DateTime.now()
    );
}