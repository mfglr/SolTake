import 'package:flutter/material.dart';
import 'package:my_social_app/state/ids.dart';
import 'package:my_social_app/state/pagination.dart';

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
  final Iterable<int> images;
  final bool isLiked;
  final int numberOfLikes;
  final bool isOwner;
  final int numberOfSolutions;
  final Ids solutions;
  final int numberOfComments;
  final Pagination comments;

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
    required this.comments
  });

  String formatUserName(int count)
    => userName.length <= count ? userName : "${userName.substring(0,10)}...";
  
  String formatContent()
    => 
    content != null ? 
      content!.length <= 25 ? 
        content! : 
        "${content!.substring(0,22)}..." :
      "Help Me!";

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
      comments: comments
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
      comments: comments
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
      comments: comments
    );
  
  QuestionState nextPageQuestionSolutions(Iterable<int> solutionIds)
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
        solutions: solutions.nextPage(solutionIds),
        comments: comments
      );
  
  QuestionState addComment(int questionCommentId)
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
      comments: comments.prependOne(questionCommentId)
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
        comments: comments.startLoading()
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
        comments: comments.addNextPage(commentIds)
      );
}
