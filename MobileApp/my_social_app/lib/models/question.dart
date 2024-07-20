import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/exam.dart';
import 'package:my_social_app/models/question_image.dart';
import 'package:my_social_app/models/subject.dart';
import 'package:my_social_app/models/topic.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
part 'question.g.dart';

@immutable
@JsonSerializable()
class Question{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int appUserId;
  final String userName;
  final String? content;
  final Exam exam;
  final Subject subject;
  final List<Topic> topics;
  final List<QuestionImage> images;
  final bool isLiked;
  final int numberOfLikes;

  const Question({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.topics,
    required this.exam,
    required this.subject,
    required this.images,
    required this.isLiked,
    required this.numberOfLikes
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionState toQuestionState() => QuestionState(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    appUserId: appUserId,
    userName: userName,
    content: content,
    examId: exam.id,
    subjectId: subject.id,
    topics: topics.map((e) => e.id),
    images: images.map((e) => e.id),
    isLiked: isLiked,
    numberOfLikes: numberOfLikes
  );
}