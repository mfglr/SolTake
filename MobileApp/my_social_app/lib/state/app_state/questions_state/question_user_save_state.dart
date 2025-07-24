import 'dart:core';
import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_status.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/topic_state.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

@immutable
class QuestionUserSaveState extends Entity<int>{
  final int questionId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isOwner;
  final int userId;
  final String userName;
  final String? content;
  final ExamState exam;
  final SubjectState subject;
  final TopicState? topic;
  final Iterable<Multimedia> medias;
  final bool isLiked;
  final bool isSaved;
  final int publishingState;
  final int numberOfLikes;
  final int numberOfSolutions;
  final int numberOfCorrectSolutions;
  final int numberOfVideoSolutions;
  final int numberOfComments;
  final Multimedia? image;

  QuestionUserSaveState({
    required super.id,
    required this.questionId,
    required this.createdAt,
    required this.updatedAt,
    required this.isOwner,
    required this.userId,
    required this.userName,
    required this.content,
    required this.exam,
    required this.subject,
    required this.topic,
    required this.medias,
    required this.isLiked,
    required this.isSaved,
    required this.publishingState,
    required this.numberOfLikes,
    required this.numberOfSolutions,
    required this.numberOfCorrectSolutions,
    required this.numberOfVideoSolutions,
    required this.numberOfComments,
    required this.image
  });

  factory QuestionUserSaveState.create(int id, QuestionState question) =>
    QuestionUserSaveState(
      id: id,
      questionId: question.id,
      createdAt: question.createdAt,
      updatedAt: question.updatedAt,
      isOwner: question.isOwner,
      userId: question.userId,
      userName: question.userName,
      content: question.content,
      exam: question.exam,
      subject: question.subject,
      topic: question.topic,
      medias: question.medias,
      isLiked: question.isLiked,
      isSaved: question.isSaved,
      publishingState: question.publishingState,
      numberOfLikes: question.numberOfLikes,
      numberOfSolutions: question.numberOfSolutions,
      numberOfCorrectSolutions: question.numberOfCorrectSolutions,
      numberOfVideoSolutions: question.numberOfVideoSolutions,
      numberOfComments: question.numberOfComments,
      image: question.image
    );

  QuestionUserSaveState _optional({
    bool? newIsLiked,
    bool? newIsSaved,
    int? newPublishingState,
    int? newNumberOfLikes,
    int? newNumberOfSolutions,
    int? newNumberOfCorrectSolutions,
    int? newNumberOfVideoSolutions,
    int? newNumberOfComments,
  }) =>
    QuestionUserSaveState(
      id: id,
      questionId: questionId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isOwner: isOwner,
      userId: userId,
      userName: userName,
      content: content,
      exam: exam,
      subject: subject,
      topic: topic,
      medias: medias,
      isLiked: newIsLiked ?? isLiked,
      isSaved: newIsSaved ?? isSaved,
      publishingState: newPublishingState ?? publishingState,
      numberOfLikes: newNumberOfLikes ?? numberOfLikes,
      numberOfSolutions: newNumberOfSolutions ?? numberOfSolutions,
      numberOfCorrectSolutions: newNumberOfCorrectSolutions ?? numberOfCorrectSolutions,
      numberOfVideoSolutions: newNumberOfVideoSolutions ?? numberOfVideoSolutions,
      numberOfComments: newNumberOfComments ?? numberOfComments,
      image: image
    );

  QuestionState toQuestionState() => QuestionState(
    id: questionId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    userId: userId,
    userName: userName,
    content: content,
    exam: exam,
    subject: subject,
    topic: topic,
    medias: medias,
    isLiked: isLiked,
    isSaved: isSaved,
    publishingState: publishingState,
    isOwner: isOwner,
    numberOfLikes: numberOfLikes,
    numberOfComments: numberOfComments,
    numberOfSolutions: numberOfSolutions,
    numberOfCorrectSolutions: numberOfCorrectSolutions,
    numberOfVideoSolutions: numberOfVideoSolutions,
    image: image
  );

  QuestionUserSaveState deleteSolution(SolutionState solution) =>
    _optional(
      newNumberOfSolutions: numberOfSolutions - 1,
      newNumberOfCorrectSolutions:
        solution.state == SolutionStatus.correct
          ? numberOfCorrectSolutions - 1
          : numberOfCorrectSolutions,
      newNumberOfVideoSolutions:
        solution.hasVideo
          ? numberOfVideoSolutions - 1
          : numberOfVideoSolutions
    );

  QuestionUserSaveState like() => _optional(newIsLiked: true, newNumberOfLikes: numberOfLikes + 1);
  QuestionUserSaveState dislike() => _optional(newIsLiked: false, newNumberOfLikes: numberOfLikes - 1); 
  QuestionUserSaveState save() => _optional(newIsSaved: true);
  QuestionUserSaveState increaseNumberOfComments() => _optional(newNumberOfComments: numberOfComments + 1);
  QuestionUserSaveState createSolution(SolutionState solution) => 
    _optional(
      newNumberOfSolutions: numberOfSolutions + 1,
      newNumberOfVideoSolutions: solution.hasVideo ? numberOfVideoSolutions + 1 : numberOfVideoSolutions,
    );

}