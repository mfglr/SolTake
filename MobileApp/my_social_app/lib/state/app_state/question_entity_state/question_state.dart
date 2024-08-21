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
  final int numberOfSolutions;
  final int numberOfComments;
  final Pagination solutions;
  final Pagination comments;
  final int state;
  final DateTime? solvedAt;

  const QuestionState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
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
    required this.numberOfSolutions,
    required this.numberOfComments,
    required this.solutions,
    required this.comments,
    required this.state,
    required this.solvedAt,
  });

  String formatUserName(int count)
    => userName.length <= count ? userName : "${userName.substring(0,10)}...";

  QuestionState like()
    => QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appUserId: appUserId,
      userName: userName,
      content: content,
      examId: examId,
      subjectId: subjectId,
      topics: topics,
      images: images,
      isLiked: true,
      numberOfLikes: numberOfLikes + 1,
      isOwner: isOwner,
      numberOfSolutions: numberOfSolutions,
      numberOfComments: numberOfComments,
      solutions: solutions,
      comments: comments,
      state: state,
      solvedAt: solvedAt,
    );
  QuestionState dislike()
    => QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appUserId: appUserId,
      userName: userName,
      content: content,
      examId: examId,
      subjectId: subjectId,
      topics: topics,
      images: images,
      isLiked: false,
      numberOfLikes: numberOfLikes - 1,
      isOwner: isOwner,
      numberOfSolutions: numberOfSolutions,
      numberOfComments: numberOfComments,
      solutions: solutions,
      comments: comments,
      state: state,
      solvedAt: solvedAt,
    );

  QuestionState addSolution(int solutionId)
    => QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appUserId: appUserId,
      userName: userName,
      content: content,
      examId: examId,
      subjectId: subjectId,
      topics: topics,
      images: images,
      isLiked: false,
      numberOfLikes: numberOfLikes,
      isOwner: isOwner,
      numberOfSolutions: numberOfSolutions + 1,
      numberOfComments: numberOfComments,
      solutions: solutions.prependOne(solutionId),
      comments: comments,
      state: state,
      solvedAt: solvedAt,
    );
  QuestionState getNextPageSolutions()
    => QuestionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        content: content,
        examId: examId,
        subjectId: subjectId,
        topics: topics,
        images: images,
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        isOwner: isOwner,
        numberOfSolutions: numberOfSolutions,
        numberOfComments: numberOfComments,
        solutions: solutions.startLoadingNext(),
        comments: comments,
        state: state,
        solvedAt: solvedAt,
      );
  QuestionState addNextPageSolutions(Iterable<int> solutionIds)
    => QuestionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        content: content,
        examId: examId,
        subjectId: subjectId,
        topics: topics,
        images: images,
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        isOwner: isOwner,
        numberOfSolutions: numberOfSolutions,
        numberOfComments: numberOfComments,
        solutions: solutions.addNextPage(solutionIds),
        comments: comments,
        state: state,
        solvedAt: solvedAt,
      );
  
  QuestionState addComment(int commentId)
    => QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appUserId: appUserId,
      userName: userName,
      content: content,
      examId: examId,
      subjectId: subjectId,
      topics: topics,
      images: images,
      isLiked: false,
      numberOfLikes: numberOfLikes,
      isOwner: isOwner,
      numberOfSolutions: numberOfSolutions,
      numberOfComments: numberOfComments + 1,
      solutions: solutions,
      comments: comments.prependOne(commentId),
      state: state,
      solvedAt: solvedAt,
    );
  QuestionState removeComment(int commentId)
    => QuestionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        content: content,
        examId: examId,
        subjectId: subjectId,
        topics: topics,
        images: images,
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        isOwner: isOwner,
        numberOfSolutions: numberOfSolutions,
        numberOfComments: numberOfComments - 1,
        solutions: solutions,
        comments: comments.removeOne(commentId),
        state: state,
        solvedAt: solvedAt,
      );
  QuestionState getNextPageComments()
    => QuestionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        content: content,
        examId: examId,
        subjectId: subjectId,
        topics: topics,
        images: images,
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        isOwner: isOwner,
        numberOfSolutions: numberOfSolutions,
        numberOfComments: numberOfComments,
        solutions: solutions,
        comments: comments.startLoadingNext(),
        state: state,
        solvedAt: solvedAt,
      );
  QuestionState addNextPageComments(Iterable<int> commentIds)
    => QuestionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        content: content,
        examId: examId,
        subjectId: subjectId,
        topics: topics,
        images: images,
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        isOwner: isOwner,
        numberOfSolutions: numberOfSolutions,
        numberOfComments: numberOfComments,
        solutions: solutions,
        comments: comments.addNextPage(commentIds),
        state: state,
        solvedAt: solvedAt,
      );

  QuestionState startLoadingImage(int index){
    if(images.elementAt(index).state != ImageStatus.notStarted) return this;
    return QuestionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        content: content,
        examId: examId,
        subjectId: subjectId,
        topics: topics,
        images: [...images.take(index),images.elementAt(index).startLoding(),...images.skip(index + 1)],
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        isOwner: isOwner,
        numberOfSolutions: numberOfSolutions,
        numberOfComments: numberOfComments,
        solutions: solutions,
        comments: comments,
        state: state,
        solvedAt: solvedAt,
      );
  }
  QuestionState loadImage(int index,Uint8List image)
    => QuestionState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        appUserId: appUserId,
        userName: userName,
        content: content,
        examId: examId,
        subjectId: subjectId,
        topics: topics,
        images: [...images.take(index),images.elementAt(index).load(image),...images.skip(index + 1)],
        isLiked: isLiked,
        numberOfLikes: numberOfLikes,
        isOwner: isOwner,
        numberOfSolutions: numberOfSolutions,
        numberOfComments: numberOfComments,
        solutions: solutions,
        comments: comments,
        state: state,
        solvedAt: solvedAt,
      );

  QuestionState markAsSolved(){
    if(state == QuestionStatus.solved) return this;
    return QuestionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      appUserId: appUserId,
      userName: userName,
      content: content,
      examId: examId,
      subjectId: subjectId,
      topics: topics,
      images: images,
      isLiked: isLiked,
      numberOfLikes: numberOfLikes,
      isOwner: isOwner,
      numberOfSolutions: numberOfSolutions,
      numberOfComments: numberOfComments,
      solutions: solutions,
      comments: comments,
      state: QuestionStatus.solved,
      solvedAt: DateTime.now()
    );
  }
    
}
