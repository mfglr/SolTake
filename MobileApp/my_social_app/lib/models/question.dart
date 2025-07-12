import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/models/exam.dart';
import 'package:my_social_app/models/subject.dart';
import 'package:my_social_app/models/topic.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
part 'question.g.dart';

@immutable
@JsonSerializable()
class Question{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int state;
  final bool isOwner;
  final int userId;
  final String userName;
  final String? content;
  final Exam exam;
  final Subject subject;
  final Topic? topic;
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

  const Question({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.userName,
    required this.content,
    required this.topic,
    required this.exam,
    required this.subject,
    required this.medias,
    required this.isLiked,
    required this.isSaved,
    required this.publishingState,
    required this.numberOfLikes,
    required this.numberOfSolutions,
    required this.numberOfCorrectSolutions,
    required this.numberOfVideoSolutions,
    required this.numberOfComments,
    required this.isOwner,
    required this.state,
    required this.image,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionState toQuestionState() => QuestionState(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    state: state,
    userId: userId,
    userName: userName,
    content: content,
    exam: exam.toExamState(),
    subject: subject.toSubjectState(),
    topic: topic?.toTopicState(),
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
    image: image,
    solutions: Pagination.init(solutionsPerPage,true),
    correctSolutions: Pagination.init(solutionsPerPage,true),
    pendingSolutions: Pagination.init(solutionsPerPage,true),
    incorrectSolutions: Pagination.init(solutionsPerPage,true),
    videoSolutions: Pagination.init(solutionsPerPage,true),
  );
}