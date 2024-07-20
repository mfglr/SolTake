import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/state/ids.dart';
import 'package:my_social_app/state/image_state.dart';
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
  final Gender gender;
  final ProfileVisibility profileVisibility;
  final int numberOfQuestions;
  final int numberOfFollowers;
  final int numberOfFolloweds;
  final bool isFollower;
  final bool isFollowed;
  final bool isRequester;
  final bool isRequested;
  final Ids followers;
  final Ids followeds;
  final Ids requesters;
  final Ids requesteds;
  final Ids questions;
  final Uint8List? image;
  final ImageState imageState;

  String formatName(int count){
    final r = (name ?? userName);
    return r.length <= count ? r : "${r.substring(0,10)}...";
  }

  String formatUserName(int count){
    return userName.length <= count ? userName : "${userName.substring(0,10)}...";
  }

  const UserState._constructor({
    required this.id,
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
    required this.isFollower,
    required this.isFollowed,
    required this.isRequester,
    required this.isRequested,
    required this.image,
    required this.imageState,
    required this.followers,
    required this.followeds,
    required this.requesters,
    required this.requesteds,
    required this.questions,
  });

  UserState _optional({
    DateTime? newUpdatedDate,
    String? newUserName,
    String? newName,
    DateTime? newBirthDate,
    Gender? newGender,
    ProfileVisibility? newProfileVisibility,
    int? newNumberOfQuestions,
    int? newNumberOfFollowers,
    int? newNumberOfFolloweds,
    bool? newIsFollower,
    bool? newIsFollowed,
    bool? newIsRequester,
    bool? newIsRequested,
    Uint8List? newImage,
    ImageState? newImageState,
    Ids? newFollowers,
    Ids? newFolloweds,
    Ids? newRequesters,
    Ids? newRequesteds,
    Ids? newQuestions
  }) => UserState._constructor(
    id: id,
    createdAt: createdAt,
    updatedAt: newUpdatedDate ?? updatedAt,
    userName: newUserName ?? userName,
    name: newName ?? name,
    birthDate: newBirthDate ?? birthDate,
    gender: newGender ?? gender,
    profileVisibility: newProfileVisibility ??  profileVisibility,
    numberOfQuestions: newNumberOfQuestions ?? numberOfQuestions,
    numberOfFollowers: newNumberOfFollowers ?? numberOfFollowers,
    numberOfFolloweds: newNumberOfFolloweds ?? numberOfFolloweds,
    isFollower: newIsFollower ?? isFollower,
    isFollowed: newIsFollowed ?? isFollowed,
    isRequester: newIsRequester ?? isRequester,
    isRequested: newIsRequested ?? isRequested,
    image: newImage ?? image,
    imageState: newImageState ?? imageState,
    followers: newFollowers ?? followers,
    followeds: newFolloweds ?? followeds,
    requesters: newRequesters ?? requesters,
    requesteds: newRequesteds ?? requesteds,
    questions: newQuestions ?? questions
  );

  factory UserState.init(User user) => UserState._constructor(
    id: user.id,
    createdAt: user.createdAt,
    updatedAt: user.updatedAt,
    userName: user.userName,
    name: user.name,
    birthDate: user.birthDate,
    gender: Gender.values[user.gender],
    profileVisibility: ProfileVisibility.values[user.profileVisibility],
    numberOfQuestions: user.numberOfQuestions,
    numberOfFollowers: user.numberOfFollowers,
    numberOfFolloweds: user.numberOfFolloweds,
    isFollower: user.isFollower,
    isFollowed: user.isFollowed,
    isRequester: user.isRequester,
    isRequested: user.isRequested,
    image: null,
    imageState: ImageState.notStarted,
    followers: const Ids(ids: [],isLast: false,lastId: null),
    followeds: const Ids(ids: [],isLast: false,lastId: null),
    requesters: const Ids(ids: [],isLast: false,lastId: null),
    requesteds: const Ids(ids: [],isLast: false,lastId: null),
    questions: const Ids(ids: [],isLast: false, lastId: null)
  );

  UserState loadFollowers(Iterable<int> newFollowers) => _optional(newFollowers: followers.nextPage(newFollowers));
  UserState loadFolloweds(Iterable<int> newFolloweds) => _optional(newFolloweds: followeds.nextPage(newFolloweds));
  UserState loadRequesters(Iterable<int> newRequesters) => _optional(newRequesters: requesters.nextPage(newRequesters));
  UserState loadRequesteds(Iterable<int> newRequesteds) => _optional(newRequesteds: requesteds.nextPage(newRequesteds));
  UserState loadQuestions(Iterable<int> newQuestions) => _optional(newQuestions: questions.nextPage(newQuestions));
  
  //make follow request start
  UserState addRequester(int currentUserId){
    if(profileVisibility == ProfileVisibility.private){
      return _optional(newIsRequested: true,newRequesters: requesters.create(currentUserId));
    }
    else{
      return _optional(
        newNumberOfFollowers: numberOfFollowers + 1,
        newIsFollowed: true,
        newFollowers: followers.create(currentUserId)
      );
    }
  }
  UserState addRequested(ProfileVisibility userProfileVisibility, int userId){
    if(userProfileVisibility == ProfileVisibility.private){
      return _optional(newRequesteds: requesteds.create(userId));
    }
    else{
      return _optional(newNumberOfFolloweds: numberOfFolloweds + 1,newFolloweds: followeds.create(userId));
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
        newFollowers: followers.remove(currentUserId)
      );
    }
  }
  UserState removeRequested(ProfileVisibility userProfileVisibility, int userId){
    if(userProfileVisibility == ProfileVisibility.private){
      return _optional(newRequesteds: requesteds.remove(userId));
    }
    else{
      return _optional(newNumberOfFolloweds: numberOfFolloweds - 1,newFolloweds: followeds.remove(userId));
    }
  }
  //cancel follow request end

  //remove follower start
  UserState removeFollower(int userId){
    return _optional(newNumberOfFollowers: numberOfFollowers - 1,newFollowers: followers.remove(userId));
  }
  UserState removeFollowed(int currentUserId){
    return _optional(
      newNumberOfFolloweds: numberOfFolloweds - 1,
      newIsFollowed: false,
      newFolloweds: followeds.remove(currentUserId)
    );
  }
  //remove follower end

  UserState startLoadingUserImage() => _optional(
    newImageState: ImageState.started
  );
  UserState loadUserImage(Uint8List newImage) => _optional(
    newImage: newImage,newImageState: ImageState.done
  );
  
  //Questions
  UserState addQuestion(int id) => _optional(
    newNumberOfQuestions: numberOfQuestions + 1,
    newQuestions: questions.create(id)
  );
}