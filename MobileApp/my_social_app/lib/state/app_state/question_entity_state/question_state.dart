import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/state/app_state/pagination.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_image_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_status.dart';

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
  final int numberOfLikes;
  final bool isOwner;
  final int numberOfComments;
  final Pagination comments;
  final int numberOfSolutions;
  final Pagination solutions;
  final int numberOfCorrectSolutions;
  final Pagination correctSolutions;
  final int numberOfPendingSolutions;
  final Pagination pendingSolutions;
  final int numberOfIncorrectSolutions;
  final Pagination incorrectSolutions; 

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
    required this.numberOfLikes,
    required this.isOwner,
    required this.numberOfComments,
    required this.comments,
    required this.numberOfSolutions,
    required this.solutions,
    required this.numberOfCorrectSolutions,
    required this.correctSolutions,
    required this.numberOfPendingSolutions,
    required this.pendingSolutions,
    required this.numberOfIncorrectSolutions,
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
    Pagination? newComments,
    int? newNumberOfSolutions,
    Pagination? newSolutions,
    int? newNumberOfCorrectSolutions,
    Pagination? newCorrectSolutions,
    int? newNumberOfPendingSolutions,
    Pagination? newPendingSolutions,
    int? newNumberOfIncorrectSolutions,
    Pagination? newIncorrectSolutions,
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
      numberOfLikes: newNumberOfLikes ?? numberOfLikes,
      isOwner: isOwner,
      numberOfComments: newNumberOfComments ?? numberOfComments,
      comments: newComments ?? comments,
      numberOfSolutions: newNumberOfSolutions ?? numberOfSolutions,
      solutions: newSolutions ?? solutions,
      numberOfCorrectSolutions: newNumberOfCorrectSolutions ?? numberOfCorrectSolutions,
      correctSolutions: newCorrectSolutions ?? correctSolutions,
      numberOfPendingSolutions: newNumberOfPendingSolutions ?? numberOfPendingSolutions,
      pendingSolutions: newPendingSolutions ?? pendingSolutions,
      numberOfIncorrectSolutions: newNumberOfIncorrectSolutions ?? numberOfIncorrectSolutions,
      incorrectSolutions: newIncorrectSolutions ?? incorrectSolutions
    );

  String formatUserName(int count) => userName.length <= count ? userName : "${userName.substring(0,10)}...";

  QuestionState like() => _optional(newIsLiked: true, newNumberOfLikes: numberOfLikes + 1); 
  QuestionState dislike() => _optional(newIsLiked: false, newNumberOfLikes: numberOfLikes - 1); 
 
  QuestionState startLoadingNextSolutions() => 
    _optional(newSolutions: solutions.startLoadingNext());
  QuestionState addNextPageSolutions(Iterable<int> solutionIds) => 
    _optional(newSolutions: solutions.addNextPage(solutionIds));
  QuestionState addSolution(int solutionId) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newSolutions: solutions.prependOne(solutionId),
    );
  QuestionState removeSolution(int solutionId) =>
    _optional(
      newSolutions: solutions.removeOne(solutionId),
      newNumberOfSolutions: numberOfSolutions - 1,
      newState: numberOfCorrectSolutions == 1 ? QuestionStatus.pending : state,
    );
     
  QuestionState startLoadingNextComments() =>
    _optional(newComments: comments.startLoadingNext());
  QuestionState addNextPageComments(Iterable<int> commentIds) => 
    _optional(newComments: comments.addNextPage(commentIds));
  QuestionState addComment(int commentId) => 
    _optional(newNumberOfComments: numberOfComments + 1,newComments: comments.prependOne(commentId));
  QuestionState removeComment(int commentId) =>
    _optional(newNumberOfComments: numberOfComments + 1,newComments: comments.removeOne(commentId));

  QuestionState startLoadingImage(int index){
    if(images.elementAt(index).state != ImageStatus.notStarted) return this;
    return _optional( newImages: [...images.take(index),images.elementAt(index).startLoding(),...images.skip(index + 1)] );
  }
  QuestionState loadImage(int index,Uint8List image) => 
    _optional(newImages: [...images.take(index),images.elementAt(index).load(image),...images.skip(index + 1)]);

  QuestionState markAsSolved(){
    if(state == QuestionStatus.solved) return this;
    return _optional(newState: QuestionStatus.solved);
  }
    
}
