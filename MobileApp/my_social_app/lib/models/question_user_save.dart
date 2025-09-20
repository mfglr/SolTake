import 'dart:core';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia.dart';
import 'package:my_social_app/models/exam.dart';
import 'package:my_social_app/models/subject.dart';
import 'package:my_social_app/models/topic.dart';
import 'package:my_social_app/state/questions_state/question_user_save_state.dart';
part 'question_user_save.g.dart';

@JsonSerializable()
@immutable
class QuestionUserSave{
  final int id;
  final int questionId;
  final DateTime createdAt;
  final DateTime? updatedAt;
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

  const QuestionUserSave({
    required this.id,
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

  factory QuestionUserSave.fromJson(Map<String, dynamic> json) => _$QuestionUserSaveFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionUserSaveToJson(this);

  // QuestionUserSaveState toState() =>
  //   QuestionUserSaveState(
  //     id: id,
  //     questionId: questionId,
  //     content: content,
  //     createdAt: createdAt,
  //     exam: exam.toExamState(),
  //     image: image,
  //     isLiked: isLiked,
  //     isOwner: isOwner,
  //     isSaved: isSaved,
  //     medias: medias.map((e) => e.toMedia()),
  //     numberOfComments: numberOfComments,
  //     numberOfCorrectSolutions: numberOfCorrectSolutions,
  //     numberOfLikes: numberOfLikes,
  //     numberOfSolutions: numberOfSolutions,
  //     numberOfVideoSolutions: numberOfVideoSolutions,
  //     publishingState: publishingState,
  //     subject: subject.toSubjectState(),
  //     topic: topic?.toTopicState(),
  //     updatedAt: updatedAt,
  //     userId: userId,
  //     userName: userName
  //   );
}