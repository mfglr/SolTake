import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/state/app_state/users_state/follow_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_image_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_story_state.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

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
  final UserImageState? userImageState;
  final Pagination<int,FollowState> followers;
  final Pagination<int,FollowState> followeds;

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
    required this.followers,
    required this.followeds,
    required this.image,
    required this.userImageState,
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
    Pagination<int,FollowState>? newFollowers,
    Pagination<int,FollowState>? newFolloweds,
    Multimedia? newImage,
    UserImageState? newUserImageState
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
    followers: newFollowers ?? followers,
    followeds: newFolloweds ?? followeds,
    image: newImage ?? image,
    stories: stories,
    userImageState: newUserImageState ?? userImageState,
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
  UserState currentFollow() => _optional(
    newNumberOfFolloweds: numberOfFolloweds + 1
  );

  //questions
  UserState createQuestion() => _optional(newNumberOfQuestions: numberOfQuestions + 1);
  //questions

  //followers
  UserState startLoadingNextFollowers() => 
    _optional(newFollowers: followers.startLoadingNext());
  UserState addNextFollowers(Iterable<FollowState> followers) => 
    _optional(newFollowers: this.followers.addNextPage(followers));
  UserState stopLoadingNextFollowers() =>
    _optional(newFollowers: followers.stopLoadingNext());

  UserState addFollower(FollowState follower) => 
    _optional(
      newNumberOfFollowers: numberOfFollowers + 1,
      newIsFollowed: true,
      newFollowers: followers.prependOne(follower)
    );
  UserState addFollowerToCurrentUser(FollowState follower) =>
    _optional(
      newNumberOfFollowers: numberOfFollowers + 1,
      newFollowers: followers.prependOne(follower)
    );
  
  UserState removeFollower(int followerId) => 
    _optional(
      newNumberOfFollowers: numberOfFollowers - 1,
      newIsFollowed: false,
      newFollowers: followers.where((e) => e.userId != followerId)
    );
  UserState removeFollowerToCurrentUser(int followerId) =>
    _optional(
      newNumberOfFollowers: numberOfFollowers - 1,
      newFollowers: followers.where((e) => e.userId != followerId)
    );

  //followeds
  UserState startLoadingNextFolloweds() =>
    _optional(newFolloweds: followeds.startLoadingNext());
  UserState addNextFolloweds(Iterable<FollowState> followeds) =>
    _optional(newFolloweds: this.followeds.addNextPage(followeds));
  UserState stopLoadingNextFolloweds() =>
    _optional(newFolloweds: followeds.stopLoadingNext());
    
  UserState addFollowed(FollowState followed)
    => _optional(
        newNumberOfFolloweds: numberOfFolloweds + 1,
        newIsFollower: true,
        newFolloweds: followeds.prependOne(followed)
      );
  UserState addFollowedToCurrentUser(FollowState followed) =>
    _optional(
      newNumberOfFolloweds: numberOfFolloweds + 1,
      newFolloweds: followeds.prependOne(followed)
    );

  UserState removeFollowed(int followedId) =>
    _optional(
      newIsFollower: false,
      newNumberOfFolloweds: numberOfFolloweds - 1,
      newFolloweds: followeds.where((e) => e.userId != followedId)
    );
  UserState removeFollowedToCurrentUser(int followedId) =>
    _optional(
      newNumberOfFolloweds: numberOfFolloweds - 1,
      newFolloweds: followeds.where((e) => e.userId != followedId)
    );

  UserState updateUserName(String userName) => 
    _optional(newUserName: userName);
  UserState updateName(String name) =>
    _optional(newName: name);
  UserState updateBiography(String biography) =>
    _optional(newBiography: biography);

  UserState uploadImage(AppFile image) =>
    _optional(newUserImageState: UserImageState(image: image, rate: 0, status: UploadStatus.loading));
  UserState uploadImageSuccess(Multimedia image) => 
    _optional(newImage: image, newUserImageState: userImageState?.success());
  UserState uploadImageFailed() =>
    _optional(newUserImageState: userImageState?.failed());
  UserState removeImage() => 
    _optional(newImage: null);
  UserState changeRate(rate)
    => _optional(newUserImageState: userImageState?.changeRate(rate));
}