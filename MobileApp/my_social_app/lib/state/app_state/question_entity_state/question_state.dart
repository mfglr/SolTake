import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
import 'package:my_social_app/state/pagination/id_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_image_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_status.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';

@immutable
class QuestionState{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int state;
  final int appUserId;
  final String userName;
  final String? content;
  final int examId;
  final int subjectId;
  final Iterable<int> topics;
  final Iterable<QuestionImageState> images;
  final bool isLiked;
  final bool isOwner;
  final int numberOfLikes;
  final int numberOfComments;
  final int numberOfSolutions;
  final int numberOfCorrectSolutions;
  final Pagination<num,QuestionUserLikeState> likes;
  final Pagination<num,IdState> comments;
  final Pagination<num,IdState> solutions;
  final Pagination<num,IdState> correctSolutions;
  final Pagination<num,IdState> pendingSolutions;
  final Pagination<num,IdState> incorrectSolutions; 

  const QuestionState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.examId,
    required this.subjectId,
    required this.topics,
    required this.images,
    required this.isLiked,
    required this.isOwner,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.numberOfSolutions,
    required this.numberOfCorrectSolutions,
    required this.likes,
    required this.comments,
    required this.solutions,
    required this.correctSolutions,
    required this.pendingSolutions,
    required this.incorrectSolutions,
  });

  QuestionState _optional({
    int? newState,
    String? newUserName,
    String? newContent,
    int? newExamId,
    int? newSubjectId,
    Iterable<int>? newTopics,
    Iterable<QuestionImageState>? newImages,
    bool? newIsLiked,
    int? newNumberOfLikes,
    int? newNumberOfComments,
    int? newNumberOfSolutions,
    int? newNumberOfCorrectSolutions,
    Pagination<num,QuestionUserLikeState>? newLikes,
    Pagination<num,IdState>? newComments,
    Pagination<num,IdState>? newSolutions,
    Pagination<num,IdState>? newCorrectSolutions,
    Pagination<num,IdState>? newPendingSolutions,
    Pagination<num,IdState>? newIncorrectSolutions,
  }) => 
    QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      state: newState ?? state,
      appUserId: appUserId,
      userName: newUserName ?? userName,
      content: newContent ?? content,
      examId: newExamId ?? examId,
      subjectId: newSubjectId ?? subjectId,
      topics: newTopics ?? topics,
      images: newImages ?? images,
      isLiked: newIsLiked ?? isLiked,
      isOwner: isOwner,
      numberOfComments: newNumberOfComments ?? numberOfComments,
      numberOfLikes: newNumberOfLikes ?? numberOfLikes,
      numberOfSolutions: newNumberOfSolutions ?? numberOfSolutions,
      numberOfCorrectSolutions: newNumberOfCorrectSolutions ?? numberOfCorrectSolutions,
      comments: newComments ?? comments,
      likes: newLikes ?? likes,
      solutions: newSolutions ?? solutions,
      correctSolutions: newCorrectSolutions ?? correctSolutions,
      pendingSolutions: newPendingSolutions ?? pendingSolutions,
      incorrectSolutions: newIncorrectSolutions ?? incorrectSolutions
    );

  String formatUserName(int count) => userName.length <= count ? userName : "${userName.substring(0,10)}...";

  QuestionState startLodingNextLikes() =>
    _optional(newLikes: likes.startLoadingNext());
  QuestionState addNextPageLikes(Iterable<QuestionUserLikeState> likes) =>
    _optional(newLikes: this.likes.addNextPage(likes));
  QuestionState like(QuestionUserLikeState like) => 
    _optional(
      newIsLiked: true,
      newLikes: likes.prependOne(like),
      newNumberOfLikes: numberOfLikes + 1
    ); 
  QuestionState dislike(int userId) => 
    _optional(
      newIsLiked: false,
      newLikes: likes.where((like) => like.userId != userId),
      newNumberOfLikes: numberOfLikes - 1
    ); 
  QuestionState addNewLike(QuestionUserLikeState like) =>
    _optional(
      newLikes: likes.addInOrder(like),
      newNumberOfLikes: numberOfLikes + 1
    );


  QuestionState markSolutionAsCorrect(int solutionId) =>
    _optional(
      newPendingSolutions: pendingSolutions.removeOne(IdState(key: solutionId)),
      newNumberOfCorrectSolutions: numberOfCorrectSolutions + 1,
      newCorrectSolutions: correctSolutions.addInOrder(IdState(key: solutionId)),
      newState: QuestionStatus.solved
    );
  QuestionState markSolutionAsIncorrect(int solutionId) =>
    _optional(
      newPendingSolutions: pendingSolutions.removeOne(IdState(key:solutionId)),
      newIncorrectSolutions: incorrectSolutions.addInOrder(IdState(key:solutionId)),
    );

  QuestionState startLoadingNextSolutions() => 
    _optional(newSolutions: solutions.startLoadingNext());
  QuestionState addNextPageSolutions(Iterable<int> solutionIds) => 
    _optional(newSolutions: solutions.addNextPage(solutionIds.map((e) => IdState(key: e))));
  QuestionState createNewSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newSolutions: solutions.prependOne(IdState(key: solutionId)),
      newPendingSolutions: pendingSolutions.prependOne(IdState(key: solutionId))
    );
  QuestionState addNewSolution(int solutionId) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newSolutions: solutions.addInOrder(IdState(key: solutionId)),
      newPendingSolutions: pendingSolutions.addInOrder(IdState(key: solutionId))
    );
  QuestionState removeSolution(SolutionState solution) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions - 1,
      newNumberOfCorrectSolutions: solution.state == SolutionStatus.correct ? numberOfCorrectSolutions - 1 : numberOfCorrectSolutions,
      newSolutions: solutions.removeOne(IdState(key: solution.id)),
      newCorrectSolutions: solution.state == SolutionStatus.correct ? correctSolutions.removeOne(IdState(key: solution.id)) : correctSolutions,
      newPendingSolutions: solution.state == SolutionStatus.pending ? pendingSolutions.removeOne(IdState(key: solution.id)) : pendingSolutions,
      newIncorrectSolutions: solution.state == SolutionStatus.incorrect ? incorrectSolutions.removeOne(IdState(key: solution.id)) : incorrectSolutions,
      newState: solution.state == SolutionStatus.correct && numberOfCorrectSolutions == 1 ? QuestionStatus.unsolved : state,
    );

  QuestionState startLoadingNextCorrectSolutions() =>
    _optional(newCorrectSolutions: correctSolutions.startLoadingNext());
  QuestionState addNextPageCorrectSolutions(Iterable<int> solutionIds) =>
    _optional(newCorrectSolutions: correctSolutions.addNextPage(solutionIds.map((e) => IdState(key: e))));
 
  QuestionState startLoadingNextPendingSolutions() =>
    _optional(newPendingSolutions: pendingSolutions.startLoadingNext());
  QuestionState addNextPagePedingSolutions(Iterable<int> solutionIds) =>
    _optional(newPendingSolutions: pendingSolutions.addNextPage(solutionIds.map((e) => IdState(key: e))));

  QuestionState startLoadinNextIncorrectSolutions() =>
    _optional(newIncorrectSolutions: incorrectSolutions.startLoadingNext());
  QuestionState addNextPageIncorrectSolutions(Iterable<int> solutionIds) =>
    _optional(newIncorrectSolutions: incorrectSolutions.addNextPage(solutionIds.map((e) => IdState(key: e))));
 
  QuestionState startLoadingNextComments() =>
    _optional(newComments: comments.startLoadingNext());
  QuestionState addNextPageComments(Iterable<int> commentIds) => 
    _optional(newComments: comments.addNextPage(commentIds.map((e) => IdState(key: e))));
  QuestionState addComment(int commentId) => 
    _optional(newNumberOfComments: numberOfComments + 1,newComments: comments.prependOne(IdState(key: commentId)));
  QuestionState removeComment(int commentId) =>
    _optional(newNumberOfComments: numberOfComments + 1,newComments: comments.removeOne(IdState(key: commentId)));
  QuestionState addNewComment(int commentId) =>
    _optional(newNumberOfComments: numberOfComments + 1,newComments: comments.addInOrder(IdState(key: commentId)));

  QuestionState startLoadingImage(int index){
    if(images.elementAt(index).state != ImageStatus.notStarted) return this;
    return _optional( newImages: [...images.take(index),images.elementAt(index).startLoding(),...images.skip(index + 1)] );
  }
  QuestionState loadImage(int index,Uint8List image) => 
    _optional(newImages: [...images.take(index),images.elementAt(index).load(image),...images.skip(index + 1)]);

  QuestionState markAsSolved() =>
    _optional(newState: QuestionStatus.solved);
    
}
