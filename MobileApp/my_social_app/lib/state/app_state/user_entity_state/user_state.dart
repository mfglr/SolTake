import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/avatar.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follow_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_image_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_story_state.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

@immutable
class UserState extends BaseEntity<int> implements Avatar{
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
  final Pagination<int,Id<int>> questions;
  final Pagination<int,Id<int>> solvedQuestions;
  final Pagination<int,Id<int>> unsolvedQuestions;
  final Pagination<int,Id<int>> savedSolutions;

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
    required this.questions,
    required this.solvedQuestions,
    required this.unsolvedQuestions,
    required this.savedSolutions,
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
    Pagination<int,Id<int>>? newQuestions,
    Pagination<int,Id<int>>? newSolvedQuestions,
    Pagination<int,Id<int>>? newUnsolvedQuestions,
    Pagination<int,Id<int>>? newSavedSolutions,
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
    questions: newQuestions ?? questions,
    solvedQuestions: newSolvedQuestions ?? solvedQuestions,
    unsolvedQuestions: newUnsolvedQuestions ?? unsolvedQuestions,
    savedSolutions: newSavedSolutions ?? savedSolutions,
    image: newImage ?? image,
    stories: stories,
    userImageState: newUserImageState ?? userImageState,
  );

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

  //questions
  UserState startLoadingNextQuestions() =>
    _optional(newQuestions: questions.startLoadingNext());
  UserState stopLoadingNextQuestions() =>
    _optional(newQuestions: questions.stopLoadingNext());
  UserState addNextPageQuestions(Iterable<Id<int>> ids) =>
    _optional(newQuestions: questions.addNextPage(ids));

  UserState addNewQuestion(int questionId) =>
    _optional(
      newNumberOfQuestions: numberOfQuestions + 1,
      newQuestions: questions.prependOne(Id(id: questionId)),
      newUnsolvedQuestions: unsolvedQuestions.prependOne(Id(id: questionId))
    );
  UserState removeQuestion(int questionId) =>
    _optional(
      newNumberOfQuestions: numberOfQuestions - 1,
      newQuestions: questions.removeOne(questionId),
      newSolvedQuestions: solvedQuestions.removeOne(questionId),
      newUnsolvedQuestions: unsolvedQuestions.removeOne(questionId)
    );
  
  //solved questions
  UserState startLoadingNextSolvedQuestions() =>
    _optional(newSolvedQuestions: solvedQuestions.startLoadingNext());
  UserState stopLoadingNextSolvedQuestions() =>
    _optional(newSolvedQuestions: solvedQuestions.stopLoadingNext());
  UserState addNextSolvedQuestions(Iterable<int> ids) =>
    _optional(newSolvedQuestions: solvedQuestions.addNextPage(ids.map((e) => Id(id: e))));

  //unsolved questions
  UserState startLoadingNextUnsolvedQuestions() =>
    _optional(newUnsolvedQuestions: unsolvedQuestions.startLoadingNext());
  UserState addNextUnsolvedQuestions(Iterable<int> ids) =>
    _optional(newUnsolvedQuestions: unsolvedQuestions.addNextPage(ids.map((e) => Id(id: e))));
  UserState stopLoadingNextUnsolvedQuestion() =>
    _optional(newUnsolvedQuestions: unsolvedQuestions.stopLoadingNext());

  UserState markQuestionAsSolved(int id) =>
    _optional(
      newSolvedQuestions: solvedQuestions.values.any((e) => e.id == id) ? solvedQuestions : solvedQuestions.addInOrder(Id(id: id)),
      newUnsolvedQuestions: unsolvedQuestions.removeOne(id)
    );
  UserState markQuestionAsUnsolved(int id) =>
    _optional(
      newSolvedQuestions: solvedQuestions.removeOne(id),
      newUnsolvedQuestions: unsolvedQuestions.addInOrder(Id(id: id)),
    );
 
  //saved solutions
  UserState startLoadingSavedSolutions() =>
    _optional(newSavedSolutions: savedSolutions.startLoadingNext());
  UserState addNextSavedSolutions(Iterable<int> saveIds) =>
    _optional(newSavedSolutions: savedSolutions.addNextPage(saveIds.map((e) => Id(id: e))));
  UserState stopLoadingSavedSolutions() =>
    _optional(newSavedSolutions: savedSolutions.stopLoadingNext());

  UserState addSavedSolution(int saveId) => _optional(newSavedSolutions: savedSolutions.prependOne(Id(id: saveId)));
  UserState removeSavedSolution(int saveId) => _optional(newSavedSolutions: savedSolutions.removeOne(saveId));

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