import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/multi_pagination.dart';
import 'package:my_social_app/state/question_entity_state/question_image_state.dart';

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
  final MultiPagination solutionPaginations;
  final MultiPagination commentPaginations;

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
    required this.solutionPaginations,
    required this.commentPaginations
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
      solutionPaginations: solutionPaginations,
      commentPaginations: commentPaginations
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
      solutionPaginations: solutionPaginations,
      commentPaginations: commentPaginations
    );

  QuestionState addSolution(int offset, int solutionId)
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
      solutionPaginations: solutionPaginations.prependOne(offset, solutionId),
      commentPaginations: commentPaginations
    );
  QuestionState getNextPageSolutions(int offset)
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
        solutionPaginations: solutionPaginations.startLoading(offset),
        commentPaginations: commentPaginations
      );
  QuestionState addNextPageSolutions(int offset, Iterable<int> solutionIds)
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
        solutionPaginations: solutionPaginations.addNextPage(offset,solutionIds),
        commentPaginations: commentPaginations
      );
  QuestionState addSolutionPagination(int offset)
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
        solutionPaginations: solutionPaginations.addPagination(offset, solutionsPerPage),
        commentPaginations: commentPaginations
      );

  QuestionState addComment(int offset, int questionCommentId)
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
      solutionPaginations: solutionPaginations,
      commentPaginations: commentPaginations.prependOne(offset, questionCommentId)
    );
  QuestionState getNextPageComments(int offset)
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
        solutionPaginations: solutionPaginations,
        commentPaginations: commentPaginations.startLoading(offset)
      );
  QuestionState addNextPageComments(int offset, Iterable<int> commentIds)
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
        solutionPaginations: solutionPaginations,
        commentPaginations: commentPaginations.addNextPage(offset, commentIds)
      );
  QuestionState addCommentsPagination(int offset)
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
        solutionPaginations: solutionPaginations,
        commentPaginations: commentPaginations.addPagination(offset, commentsPerPage)
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
        solutionPaginations: solutionPaginations,
        commentPaginations: commentPaginations
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
        solutionPaginations: solutionPaginations,
        commentPaginations: commentPaginations
      );
}
