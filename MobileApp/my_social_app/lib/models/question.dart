import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/models/exam.dart';
import 'package:my_social_app/models/question_image.dart';
import 'package:my_social_app/models/subject.dart';
import 'package:my_social_app/models/topic.dart';
import 'package:my_social_app/state/app_state/question_entity_state/uploading_solutions/uploading_solutions_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
part 'question.g.dart';

@JsonSerializable()
@immutable
class Question{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isOwner;
  final int state;
  final int appUserId;
  final String userName;
  final String content;
  final Exam exam;
  final Subject subject;
  final Topic? topic;
  final List<QuestionImage> images;
  final bool isLiked;
  final bool isSaved;
  final int numberOfLikes;
  final int numberOfSolutions;
  final int numberOfCorrectSolutions;
  final int numberOfVideoSolutions;
  final int numberOfComments;

  const Question({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.topic,
    required this.exam,
    required this.subject,
    required this.images,
    required this.isLiked,
    required this.isSaved,
    required this.numberOfLikes,
    required this.numberOfSolutions,
    required this.numberOfCorrectSolutions,
    required this.numberOfVideoSolutions,
    required this.numberOfComments,
    required this.isOwner,
    required this.state,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionState toQuestionState() => QuestionState(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    state: state,
    appUserId: appUserId,
    userName: userName,
    content: content,
    examId: exam.id,
    subjectId: subject.id,
    topicId: topic?.id,
    images: images.map((e) => e.toQuestionImageState()),
    isLiked: isLiked,
    isSaved: isSaved,
    isOwner: isOwner,
    numberOfLikes: numberOfLikes,
    numberOfComments: numberOfComments,
    numberOfSolutions: numberOfSolutions,
    numberOfCorrectSolutions: numberOfCorrectSolutions,
    numberOfVideoSolutions: numberOfVideoSolutions,
    likes: Pagination.init(usersPerPage,true),
    comments: Pagination.init(commentsPerPage,true),
    solutions: Pagination.init(solutionsPerPage,true),
    correctSolutions: Pagination.init(solutionsPerPage,true),
    pendingSolutions: Pagination.init(solutionsPerPage,true),
    incorrectSolutions: Pagination.init(solutionsPerPage,true),
    videoSolutions: Pagination.init(solutionsPerPage,true),
    uploadingSolutions: const UploadingSolutionsState(solutions: []),
  );
}