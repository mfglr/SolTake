import 'package:flutter/material.dart';
import 'package:my_social_app/state/ids.dart';
import 'package:my_social_app/state/pagination.dart';
import 'package:my_social_app/state/user_entity_state/gender.dart';
import 'package:my_social_app/state/user_entity_state/profilevisibility.dart';

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
  final ProfileVisibility profileVisibility;
  final int numberOfQuestions;
  final int numberOfFollowers;
  final int numberOfFolloweds;
  final bool isFollower;
  final bool isFollowed;
  final bool isRequester;
  final bool isRequested;
  final Pagination followers;
  final Pagination followeds;
  final Pagination notFolloweds;
  final Pagination questions;
  final Pagination messages;
  final Ids requesters;
  final Ids requesteds;

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
    required this.profileVisibility,
    required this.numberOfQuestions,
    required this.numberOfFollowers,
    required this.numberOfFolloweds,
    required this.isFollower,
    required this.isFollowed,
    required this.isRequester,
    required this.isRequested,
    required this.followers,
    required this.followeds,
    required this.requesters,
    required this.requesteds,
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
    ProfileVisibility? newProfileVisibility,
    int? newNumberOfQuestions,
    int? newNumberOfFollowers,
    int? newNumberOfFolloweds,
    bool? newIsFollower,
    bool? newIsFollowed,
    bool? newIsRequester,
    bool? newIsRequested,
    Pagination? newFollowers,
    Pagination? newFolloweds,
    Ids? newRequesters,
    Ids? newRequesteds,
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
    profileVisibility: newProfileVisibility ??  profileVisibility,
    numberOfQuestions: newNumberOfQuestions ?? numberOfQuestions,
    numberOfFollowers: newNumberOfFollowers ?? numberOfFollowers,
    numberOfFolloweds: newNumberOfFolloweds ?? numberOfFolloweds,
    isFollower: newIsFollower ?? isFollower,
    isFollowed: newIsFollowed ?? isFollowed,
    isRequester: newIsRequester ?? isRequester,
    isRequested: newIsRequested ?? isRequested,
    followers: newFollowers ?? followers,
    followeds: newFolloweds ?? followeds,
    requesters: newRequesters ?? requesters,
    requesteds: newRequesteds ?? requesteds,
    questions: newQuestions ?? questions,
    messages: newMessages ?? messages,
    notFolloweds: newNotFolloweds ?? notFolloweds
  );

  UserState loadRequesters(Iterable<int> newRequesters) => _optional(newRequesters: requesters.nextPage(newRequesters));
  UserState loadRequesteds(Iterable<int> newRequesteds) => _optional(newRequesteds: requesteds.nextPage(newRequesteds));
  
  UserState getNextPageFollowers() => _optional(newFollowers: followers.startLoading());
  UserState addNextPageFollowers(Iterable<int> newFollowers)=> _optional(newFollowers: followers.appendNextPage(newFollowers));

  UserState getNextPageFolloweds() => _optional(newFolloweds: followeds.startLoading());
  UserState addNextPageFolloweds(Iterable<int> newFolloweds) => _optional(newFolloweds: followeds.appendNextPage(newFolloweds));

  UserState addQuestion(int id) => _optional(newNumberOfQuestions: numberOfQuestions + 1,newQuestions: questions.prependOne(id));
  UserState getNextPageQuestions() => _optional(newQuestions: questions.startLoading());
  UserState addNextPageQuestions(Iterable<int> newQuestions) => _optional(newQuestions: questions.appendNextPage(newQuestions));
  
  //not followeds
  UserState getNextPageNotFolloweds() => _optional(newNotFolloweds: notFolloweds.startLoading());
  UserState addNextPageNotFolloweds(Iterable<int> userIds) => _optional(newNotFolloweds: notFolloweds.appendNextPage(userIds));
  UserState removeNotFollowed(int notFollowedId) => _optional(newNotFolloweds: notFolloweds.removeOne(notFollowedId));
  UserState addNotFollowed(int notFollowedId) => _optional(newNotFolloweds: notFolloweds.prependOne(notFollowedId));

  //make follow request start
  UserState addRequester(int currentUserId){
    if(profileVisibility == ProfileVisibility.private){
      return _optional(newIsRequested: true,newRequesters: requesters.prependOne(currentUserId));
    }
    else{
      return _optional(
        newNumberOfFollowers: numberOfFollowers + 1,
        newIsFollowed: true,
        newFollowers: followers.prependOne(currentUserId)
      );
    }
  }
  UserState addRequested(ProfileVisibility userProfileVisibility, int userId){
    if(userProfileVisibility == ProfileVisibility.private){
      return _optional(newRequesteds: requesteds.prependOne(userId));
    }
    else{
      return _optional(newNumberOfFolloweds: numberOfFolloweds + 1,newFolloweds: followeds.prependOne(userId));
    }
  }
  //make follow request end

  //cancel follow request start
  UserState removeRequester(int currentUserId){
    if(profileVisibility == ProfileVisibility.private){
      return _optional(newIsRequested: false,newRequesters: requesters.remove(currentUserId));
    }
    else{
      return _optional(
        newNumberOfFollowers: numberOfFollowers - 1,
        newIsFollowed: false,
        newFollowers: followers.removeOne(currentUserId)
      );
    }
  }
  UserState removeRequested(ProfileVisibility userProfileVisibility, int userId){
    if(userProfileVisibility == ProfileVisibility.private){
      return _optional(newRequesteds: requesteds.remove(userId));
    }
    else{
      return _optional(newNumberOfFolloweds: numberOfFolloweds - 1,newFolloweds: followeds.removeOne(userId));
    }
  }
  //cancel follow request end

  //remove follower start
  UserState removeFollower(int userId){
    return _optional(newNumberOfFollowers: numberOfFollowers - 1,newFollowers: followers.removeOne(userId));
  }
  UserState removeFollowed(int currentUserId){
    return _optional(
      newNumberOfFolloweds: numberOfFolloweds - 1,
      newIsFollowed: false,
      newFolloweds: followeds.removeOne(currentUserId)
    );
  }
  //remove follower end
  
  UserState addMessage(int messageId) => _optional(newMessages: messages.appendOne(messageId));
  UserState nextPageMessages() => _optional(newMessages: messages.startLoading());
  UserState addNextPageMessages(Iterable<int> messageIds) => _optional(newMessages: messages.prependNextPage(messageIds));

  UserState changeProfileImageStatus(bool value) => _optional(newHasImage: value);

  UserState updateUserName(String userName) => _optional(newUserName: userName);
  UserState updateName(String name) => _optional(newName: name == "" ? null : name );
}