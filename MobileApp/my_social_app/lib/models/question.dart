import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/question_entity_state/question_image_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/question_entity_state/question_topic_state.dart';
part 'question.g.dart';

@immutable
@JsonSerializable()
class QuestionTopic{
  final int id;
  final String name;
  const QuestionTopic({required this.id, required this.name});

  factory QuestionTopic.fromJson(Map<String, dynamic> json) => _$QuestionTopicFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionTopicToJson(this);
  
  QuestionTopicState toQuestionTopicState() => QuestionTopicState(id: id, name: name);
}

@immutable
@JsonSerializable()
class QuestionImage{
  final int height;
  final int width;
  final String blobName;
  const QuestionImage({required this.height,required this.width,required this.blobName});

  factory QuestionImage.fromJson(Map<String, dynamic> json) => _$QuestionImageFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionImageToJson(this);

  QuestionImageState toQuestionImageState()
    => QuestionImageState(height: height,width: width,blobName: blobName, state: ImageState.notStarted,image: null,file: null);
}

@immutable
@JsonSerializable()
class Question{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int appUserId;
  final String userName;
  final String? content;
  final int examId;
  final String examName;
  final int subjectId;
  final String subjectName;
  final List<QuestionTopic> topics;
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
    required this.examId,
    required this.examName,
    required this.subjectId,
    required this.subjectName,
    required this.topics,
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
    examId: examId,
    examName: examName,
    subjectId: subjectId,
    subjectName: subjectName,
    topics: topics.map((e) => e.toQuestionTopicState()).toList(),
    images: images.map((e) => e.toQuestionImageState()).toList(),
    isLiked: isLiked,
    numberOfLikes: numberOfLikes
  );
}