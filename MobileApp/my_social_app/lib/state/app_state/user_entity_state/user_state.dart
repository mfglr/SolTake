import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
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
  final Pagination solvedQuestions;
  final Pagination unsolvedQuestions;
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
    required this.solvedQuestions,
    required this.unsolvedQuestions,
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
    Pagination? newSolvedQuestions,
    Pagination? newUnsolvedQuestions,
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
    solvedQuestions: newSolvedQuestions ?? solvedQuestions,
    unsolvedQuestions: newUnsolvedQuestions ?? unsolvedQuestions,
    messages: newMessages ?? messages,
    notFolloweds: newNotFolloweds ?? notFolloweds
  );
  
  //followers
  UserState getNextPageFollowers() => 
    _optional(
      newFollowers: followers.startLoadingNext()
    );
  UserState addNextPageFollowers(Iterable<int> followIds) => 
    _optional(
      newFollowers: followers.addNextPage(followIds)
    );
  UserState addFollower(int followId) => 
    _optional(
      newNumberOfFollowers: numberOfFollowers + 1,
      newIsFollowed: true,
      newFollowers: followers.prependOne(followId)
    );
  UserState removeFollower(int followId) => 
    _optional(
      newNumberOfFollowers: numberOfFollowers - 1,
      newIsFollowed: false,
      newFollowers: followers.removeOne(followId)
    );
  UserState addFollowerToCurrentUser(int followId) =>
    _optional(
      newNumberOfFollowers: numberOfFollowers + 1,
      newFollowers: followers.prependOne(followId)
    );
  UserState removeFollowerToCurrentUser(int followId) =>
    _optional(
      newNumberOfFollowers: numberOfFollowers - 1,
      newFollowers: followers.removeOne(followId)
    );

  //followeds
  UserState getNextPageFolloweds() =>
    _optional(
      newFolloweds: followeds.startLoadingNext()
    );
  UserState addNextPageFolloweds(Iterable<int> ids) =>
    _optional(
      newFolloweds: followeds.addNextPage(ids)
    );
  UserState addFollowed(int followId)
    => _optional(
        newNumberOfFolloweds: numberOfFolloweds + 1,
        newIsFollower: true,
        newFolloweds: followeds.prependOne(followId)
      );
  UserState removeFollowed(int followId) =>
    _optional(
      newNumberOfFolloweds: numberOfFolloweds - 1,
      newIsFollower: false,
      newFolloweds: followeds.removeOne(followId)
    );
  UserState addFollowedToCurrentUser(int followId) =>
    _optional(
      newNumberOfFolloweds: numberOfFolloweds + 1,
      newFolloweds: followeds.prependOne(followId)
    );
  UserState removeFollowedToCurrentUser(int followId) =>
    _optional(
      newNumberOfFolloweds: numberOfFolloweds - 1,
      newFolloweds: followeds.removeOne(followId)
    );


  //not followeds
  UserState getNextPageNotFolloweds() =>
    _optional(
      newNotFolloweds: notFolloweds.startLoadingNext()
    );
  UserState addNextPageNotFolloweds(Iterable<int> ids) =>
    _optional(
      newNotFolloweds: notFolloweds.addNextPage(ids)
    );
  UserState addNotFollowed(int id) =>
    _optional(
      newNotFolloweds: notFolloweds.prependOne(id)
    );
  UserState removeNotFollowed(int id) =>
    _optional(
      newNotFolloweds: notFolloweds.removeOne(id)
    );

  //questions
  UserState getNextPageQuestions() =>
    _optional(
      newQuestions: questions.startLoadingNext()
    );
  UserState addNextPageQuestions(Iterable<int> ids) =>
    _optional(
      newQuestions: questions.addNextPage(ids)
    );
  UserState addNewQuestion(int id) =>
    _optional(
      newNumberOfQuestions: numberOfQuestions + 1,
      newQuestions: questions.prependOne(id),
      newUnsolvedQuestions: unsolvedQuestions.prependOne(id)
    );
  UserState removeQuestion(int questionId) =>
    _optional(
      newNumberOfQuestions: numberOfQuestions - 1,
      newQuestions: questions.removeOne(questionId),
      newSolvedQuestions: solvedQuestions.removeOne(questionId),
      newUnsolvedQuestions: unsolvedQuestions.removeOne(questionId)
    );
  
  //solved questions
  UserState getNextPageSolvedQuestions() =>
    _optional(
      newSolvedQuestions: solvedQuestions.startLoadingNext()
    );
  UserState addNextPageSolvedQuestions(Iterable<int> ids) =>
    _optional(
      newSolvedQuestions: solvedQuestions.addNextPage(ids)
    );

  //unsolved questions
  UserState getNextPageUnsolvedQuestions() =>
    _optional(
      newUnsolvedQuestions: unsolvedQuestions.startLoadingNext()
    );
  UserState addNextPageUnsolvedQuestions(Iterable<int> ids) =>
    _optional(
      newUnsolvedQuestions: unsolvedQuestions.addNextPage(ids)
    );
  
  UserState markQuestionAsSolved(int id) =>
    _optional(
      newSolvedQuestions: solvedQuestions.ids.any((e) => e == id) ? solvedQuestions : solvedQuestions.addInOrder(id),
      newUnsolvedQuestions: unsolvedQuestions.removeOne(id)
    );
  UserState markQuestionAsUnsolved(int id) =>
    _optional(
      newSolvedQuestions: solvedQuestions.removeOne(id),
      newUnsolvedQuestions: unsolvedQuestions.addInOrder(id),
    );

  //messages
  UserState nextPageMessages() =>
    _optional(newMessages: messages.startLoadingNext());
  UserState addNextPageMessages(Iterable<int> messageIds) =>
    _optional(newMessages: messages.addNextPage(messageIds));
  UserState addMessage(int messageId) =>
    _optional(newMessages: messages.prependOne(messageId));
  UserState removeMessage(int messageId) =>
    _optional(newMessages: messages.removeOne(messageId));
  UserState removeMessages(Iterable<int> messageIds) =>
    _optional(newMessages: messages.removeMany(messageIds));

  UserState changeProfileImageStatus(bool value) =>
    _optional(newHasImage: value);
  UserState updateUserName(String userName) =>
    _optional(newUserName: userName);
  UserState updateName(String name) =>
    _optional(newName: name == "" ? null : name);
}