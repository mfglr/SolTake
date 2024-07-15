import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@immutable
@JsonSerializable()
class QuestionTopic{
  final int id;
  final String name;
  const QuestionTopic({required this.id, required this.name});

  factory QuestionTopic.fromJson(Map<String, dynamic> json) => _$QuestionTopicFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionTopicToJson(this);
}

@immutable
@JsonSerializable()
class QuestionImage{
  final int id;
  final String blobName;
  const QuestionImage({required this.id, required this.blobName});

  factory QuestionImage.fromJson(Map<String, dynamic> json) => _$QuestionImageFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionImageToJson(this);
}

@immutable
@JsonSerializable()
class Question{
  final int id;
  final DateTime createAt;
  final DateTime? updatedAt;
  final int appUserId;
  final String userName;
  final String content;
  final int examId;
  final String examName;
  final int subjectId;
  final String subjectName;
  final List<QuestionTopic> topics;
  final List<QuestionImage> images;

  const Question({
    required this.id,
    required this.createAt,
    required this.updatedAt,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.examId,
    required this.examName,
    required this.subjectId,
    required this.subjectName,
    required this.topics,
    required this.images
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}