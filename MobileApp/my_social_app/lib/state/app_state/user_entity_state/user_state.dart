import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/pagination.dart';
import 'package:my_social_app/state/app_state/user_entity_state/gender.dart';

@immutable
class UserState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userName;
  final String? name;
  final DateTime? birthDate;
  final bool hasImage;
  final Gender gender;
  final int numberOfQuestions;
  final int numberOfFollowers;
  final int numberOfFolloweds;
  final bool isFollower;
  final bool isFollowed;
  final Pagination followers;
  final Pagination followeds;
  final Pagination notFolloweds;
  final Pagination questions;
  final Pagination messages;

  String formatName(int count){
    final r = (name ?? userName);
    return r.length <= count ? r : "${r.substring(0,count)}...";
  }

  String formatUserName({int count = 15}){
    return userName.length <= count ? userName : "${userName.substring(0,count)}...";
  }

  const UserState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userName,
    required this.hasImage,
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.numberOfQuestions,
    required this.numberOfFollowers,
    required this.numberOfFolloweds,
    required this.isFollower,
    required this.isFollowed,
    required this.followers,
    required this.followeds,
    required this.questions,
    required this.messages,
    required this.notFolloweds
  });

  UserState _optional({
    DateTime? newUpdatedDate,
    String? newUserName,
    String? newName,
    DateTime? newBirthDate,
    bool? newHasImage,
    Gender? newGender,
    int? newNumberOfQuestions,
    int? newNumberOfFollowers,
    int? newNumberOfFolloweds,
    bool? newIsFollower,
    bool? newIsFollowed,
    Pagination? newFollowers,
    Pagination? newFolloweds,
    Pagination? newQuestions,
    Pagination? newMessages,
    Pagination? newNotFolloweds
  }) => UserState(
    id: id,
    createdAt: createdAt,
    updatedAt: newUpdatedDate ?? updatedAt,
    userName: newUserName ?? userName,
    name: newName ?? name,
    birthDate: newBirthDate ?? birthDate,
    hasImage: newHasImage ?? hasImage,
    gender: newGender ?? gender,
    numberOfQuestions: newNumberOfQuestions ?? numberOfQuestions,
    numberOfFollowers: newNumberOfFollowers ?? numberOfFollowers,
    numberOfFolloweds: newNumberOfFolloweds ?? numberOfFolloweds,
    isFollower: newIsFollower ?? isFollower,
    isFollowed: newIsFollowed ?? isFollowed,
    followers: newFollowers ?? followers,
    followeds: newFolloweds ?? followeds,
    questions: newQuestions ?? questions,
    messages: newMessages ?? messages,
    notFolloweds: newNotFolloweds ?? notFolloweds
  );
  
  //followers
  UserState getNextPageFollowers() => _optional(newFollowers: followers.startLoadingNext());
  UserState addNextPageFollowers(Iterable<int> newFollowers)=> _optional(newFollowers: followers.addNextPage(newFollowers));
  UserState addFollower(int followerId)
    => _optional(newNumberOfFollowers:numberOfFollowers + 1,newIsFollowed:true,newFollowers:followers.prependOne(followerId));
  UserState removeFollower(int followerId) 
    => _optional(newNumberOfFollowers:numberOfFollowers - 1,newIsFollowed:false,newFollowers:followers.removeOne(followerId));
  
  //followeds
  UserState getNextPageFolloweds() => _optional(newFolloweds: followeds.startLoadingNext());
  UserState addNextPageFolloweds(Iterable<int> newFolloweds) => _optional(newFolloweds: followeds.addNextPage(newFolloweds));
  UserState addFollowed(int followedId)
    => _optional(newNumberOfFolloweds: numberOfFolloweds + 1,newFolloweds: followeds.prependOne(followedId));
  UserState removeFollowed(int followedId)
    => _optional(newNumberOfFolloweds: numberOfFolloweds - 1,newIsFollower:false,newFolloweds: followeds.removeOne(followedId));

  //not followeds
  UserState getNextPageNotFolloweds() => _optional(newNotFolloweds: notFolloweds.startLoadingNext());
  UserState addNextPageNotFolloweds(Iterable<int> userIds) => _optional(newNotFolloweds: notFolloweds.addNextPage(userIds));
  UserState removeNotFollowed(int notFollowedId) => _optional(newNotFolloweds: notFolloweds.removeOne(notFollowedId));
  UserState addNotFollowed(int notFollowedId) => _optional(newNotFolloweds: notFolloweds.prependOne(notFollowedId));

  //questions
  UserState getNextPageQuestions() => _optional(newQuestions: questions.startLoadingNext());
  UserState addNextPageQuestions(Iterable<int> newQuestions) => _optional(newQuestions: questions.addNextPage(newQuestions));
  UserState addQuestion(int id) => _optional(newNumberOfQuestions: numberOfQuestions + 1,newQuestions: questions.prependOne(id));
  
  //messages
  UserState nextPageMessages() => _optional(newMessages: messages.startLoadingNext());
  UserState addNextPageMessages(Iterable<int> messageIds) => _optional(newMessages: messages.addPrevPage(messageIds));
  UserState addMessage(int messageId) => _optional(newMessages: messages.appendOne(messageId));

  UserState changeProfileImageStatus(bool value) => _optional(newHasImage: value);
  UserState updateUserName(String userName) => _optional(newUserName: userName);
  UserState updateName(String name) => _optional(newName: name == "" ? null : name );
}