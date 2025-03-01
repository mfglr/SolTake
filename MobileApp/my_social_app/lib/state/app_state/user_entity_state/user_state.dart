import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/models/avatar.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/state/app_state/user_entity_state/followed_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follower_state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_image_state.dart';
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
  final UserImageState? userImageState;
  final Pagination<num,FollowerState> followers;
  final Pagination<num,FollowedState> followeds;
  final Pagination<num,Id<num>> notFolloweds;
  final Pagination<num,Id<num>> questions;
  final Pagination<num,Id<num>> solvedQuestions;
  final Pagination<num,Id<num>> unsolvedQuestions;
  final Pagination<num,Id<num>> savedQuestions;
  final Pagination<num,Id<num>> savedSolutions;
  final Pagination<num,Id<num>> messages;
  final Pagination<num,Id<num>> conversations;

  @override
  Multimedia? get avatar => image;
  @override
  num get avatarId => id;

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
    required this.savedQuestions,
    required this.savedSolutions,
    required this.messages,
    required this.notFolloweds,
    required this.conversations,
    required this.image,
    required this.userImageState
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
    Pagination<num,FollowerState>? newFollowers,
    Pagination<num,FollowedState>? newFolloweds,
    Pagination<num,Id<num>>? newQuestions,
    Pagination<num,Id<num>>? newSolvedQuestions,
    Pagination<num,Id<num>>? newUnsolvedQuestions,
    Pagination<num,Id<num>>? newSavedQuestions,
    Pagination<num,Id<num>>? newSavedSolutions,
    Pagination<num,Id<num>>? newMessages,
    Pagination<num,Id<num>>? newNotFolloweds,
    Pagination<num,Id<num>>? newConversations,
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
    savedQuestions: newSavedQuestions ?? savedQuestions,
    savedSolutions: newSavedSolutions ?? savedSolutions,
    messages: newMessages ?? messages,
    notFolloweds: newNotFolloweds ?? notFolloweds,
    conversations: newConversations ?? conversations,
    image: newImage ?? image,
    userImageState: newUserImageState ?? userImageState
  );

  //followers
  UserState startLoadingNextFollowers() => 
    _optional(newFollowers: followers.startLoadingNext());
  UserState addNextFollowers(Iterable<FollowerState> followers) => 
    _optional(newFollowers: this.followers.addNextPage(followers));
  UserState stopLoadingNextFollowers() =>
    _optional(newFollowers: followers.stopLoadingNext());

  UserState addFollower(FollowerState follower) => 
    _optional(
      newNumberOfFollowers: numberOfFollowers + 1,
      newIsFollowed: true,
      newFollowers: followers.prependOne(follower)
    );
  UserState removeFollower(int followId) => 
    _optional(
      newNumberOfFollowers: numberOfFollowers - 1,
      newIsFollowed: false,
      newFollowers: followers.removeOne(followId)
    );
  UserState addFollowerToCurrentUser(FollowerState follower) =>
    _optional(
      newNumberOfFollowers: numberOfFollowers + 1,
      newFollowers: followers.prependOne(follower)
    );
  UserState removeFollowerToCurrentUser(int followId) =>
    _optional(
      newNumberOfFollowers: numberOfFollowers - 1,
      newFollowers: followers.removeOne(followId)
    );

  //followeds
  UserState startLoadingNextFolloweds() =>
    _optional(newFolloweds: followeds.startLoadingNext());
  UserState addNextFolloweds(Iterable<FollowedState> followeds) =>
    _optional(newFolloweds: this.followeds.addNextPage(followeds));
  UserState stopLoadingNextFolloweds() =>
    _optional(newFolloweds: followeds.stopLoadingNext());
    
  UserState addFollowed(FollowedState followed)
    => _optional(
        newNumberOfFolloweds: numberOfFolloweds + 1,
        newIsFollower: true,
        newFolloweds: followeds.prependOne(followed)
      );
  UserState removeFollowed(num followId) =>
    _optional(
      newNumberOfFolloweds: numberOfFolloweds - 1,
      newIsFollower: false,
      newFolloweds: followeds.removeOne(followId)
    );
  UserState addFollowedToCurrentUser(FollowedState followed) =>
    _optional(
      newNumberOfFolloweds: numberOfFolloweds + 1,
      newFolloweds: followeds.prependOne(followed)
    );
  UserState removeFollowedToCurrentUser(int followId) =>
    _optional(
      newNumberOfFolloweds: numberOfFolloweds - 1,
      newFolloweds: followeds.removeOne(followId)
    );


  //not followeds
  UserState getNextPageNotFolloweds() =>
    _optional(newNotFolloweds: notFolloweds.startLoadingNext());
  UserState addNextPageNotFolloweds(Iterable<num> ids) =>
    _optional(newNotFolloweds: notFolloweds.addNextPage(ids.map((e) => Id(id: id))));
  UserState addNotFollowed(num id) =>
    _optional(newNotFolloweds: notFolloweds.prependOne(Id(id: id)));
  UserState removeNotFollowed(num id) =>
    _optional(newNotFolloweds: notFolloweds.removeOne(id));

  //questions
  UserState startLoadingNextQuestions() =>
    _optional(newQuestions: questions.startLoadingNext());
  UserState stopLoadingNextQuestions() =>
    _optional(newQuestions: questions.stopLoadingNext());
  UserState addNextPageQuestions(Iterable<num> ids) =>
    _optional(newQuestions: questions.addNextPage(ids.map((e) => Id(id: e))));

  UserState addNewQuestion(num questionId) =>
    _optional(
      newNumberOfQuestions: numberOfQuestions + 1,
      newQuestions: questions.prependOne(Id(id: questionId)),
      newUnsolvedQuestions: unsolvedQuestions.prependOne(Id(id: questionId))
    );
  UserState removeQuestion(num questionId) =>
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
  UserState addNextSolvedQuestions(Iterable<num> ids) =>
    _optional(newSolvedQuestions: solvedQuestions.addNextPage(ids.map((e) => Id(id: e))));

  //unsolved questions
  UserState startLoadingNextUnsolvedQuestions() =>
    _optional(newUnsolvedQuestions: unsolvedQuestions.startLoadingNext());
  UserState addNextUnsolvedQuestions(Iterable<num> ids) =>
    _optional(newUnsolvedQuestions: unsolvedQuestions.addNextPage(ids.map((e) => Id(id: e))));
  UserState stopLoadingNextUnsolvedQuestion() =>
    _optional(newUnsolvedQuestions: unsolvedQuestions.stopLoadingNext());

  UserState markQuestionAsSolved(num id) =>
    _optional(
      newSolvedQuestions: solvedQuestions.values.any((e) => e.id == id) ? solvedQuestions : solvedQuestions.addInOrder(Id(id: id)),
      newUnsolvedQuestions: unsolvedQuestions.removeOne(id)
    );
  UserState markQuestionAsUnsolved(num id) =>
    _optional(
      newSolvedQuestions: solvedQuestions.removeOne(id),
      newUnsolvedQuestions: unsolvedQuestions.addInOrder(Id(id: id)),
    );
  
  //saved questions
  UserState startLoadingNextSavedQuestions() => 
    _optional(newSavedQuestions: savedQuestions.startLoadingNext());
  UserState addNextSavedQuestions(Iterable<num> saveIds) => 
    _optional(newSavedQuestions: savedQuestions.addNextPage(saveIds.map((e) => Id(id: e))));
  UserState stopLoadingNextSavedQuestions() =>
    _optional(newSavedQuestions: savedQuestions.stopLoadingNext());
    
  UserState addSavedQuestion(num saveId) => _optional(newSavedQuestions: savedQuestions.prependOne(Id(id: saveId)));
  UserState removeSavedQuestion(num saveId) => _optional(newSavedQuestions: savedQuestions.removeOne(saveId));

  //saved solutions
  UserState startLoadingSavedSolutions() =>
    _optional(newSavedSolutions: savedSolutions.startLoadingNext());
  UserState addNextSavedSolutions(Iterable<num> saveIds) =>
    _optional(newSavedSolutions: savedSolutions.addNextPage(saveIds.map((e) => Id(id: e))));
  UserState stopLoadingSavedSolutions() =>
    _optional(newSavedSolutions: savedSolutions.stopLoadingNext());

  UserState addSavedSolution(num saveId) => _optional(newSavedSolutions: savedSolutions.prependOne(Id(id: saveId)));
  UserState removeSavedSolution(num saveId) => _optional(newSavedSolutions: savedSolutions.removeOne(saveId));

  //messages
  UserState startLoadingNextMessages() =>
    _optional(newMessages: messages.startLoadingNext());
  UserState addNextMessages(Iterable<int> messageIds) =>
    _optional(newMessages: messages.addNextPage(messageIds.map((e) => Id(id: e))));
  UserState stopLoadingNextMessages() =>
    _optional(newMessages: messages.stopLoadingNext());

  UserState addMessage(int messageId) =>
    _optional(newMessages: messages.prependOne(Id(id: messageId)));
  UserState removeMessage(int messageId) =>
    _optional(newMessages: messages.removeOne(messageId));
  UserState removeMessages(Iterable<int> messageIds) =>
    _optional(newMessages: messages.removeMany(messageIds));

  //converations
  UserState startLoadingNextConversations() =>
    _optional(newConversations: conversations.startLoadingNext());
  UserState addNextConversations(Iterable<num> ids) =>
    _optional(newConversations: conversations.addNextPage(ids.map((e) => Id(id: e))));
  UserState stopLoadingNextConversations() =>
    _optional(newConversations: conversations.stopLoadingNext());

  UserState addConversation(num id) =>
    _optional(newConversations: conversations.prependOne(Id(id: id)));
  UserState addConversationInOrder(num id) =>
    _optional(newConversations: conversations.addInOrder(Id(id: id)));
  UserState removeConversation(num id) =>
    _optional(newConversations: conversations.removeOne(id));

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
  UserState removeImage() => UserState(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    userName: userName,
    name: name,
    biography: biography,
    numberOfQuestions: numberOfQuestions,
    numberOfFollowers: numberOfFollowers,
    numberOfFolloweds: numberOfFolloweds,
    isFollower: isFollower,
    isFollowed: isFollowed,
    followers: followers,
    followeds: followeds,
    questions: questions,
    solvedQuestions: solvedQuestions,
    unsolvedQuestions: unsolvedQuestions,
    savedQuestions: savedQuestions,
    savedSolutions: savedSolutions,
    messages: messages,
    notFolloweds: notFolloweds,
    conversations: conversations,
    image: null,
    userImageState: userImageState
  );
  UserState changeRate(rate)
    => _optional(newUserImageState: userImageState?.changeRate(rate));
}