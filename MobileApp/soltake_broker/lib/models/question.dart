import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:soltake_broker/state/app_state/question_state/question_state.dart';
part 'question.g.dart';

@immutable
@JsonSerializable()
class Question{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int userId;
  final String userName;
  final String? content;
  final Iterable<Multimedia> medias;
  final Multimedia? image;

  const Question({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.userName,
    required this.content,
    required this.medias,
    required this.image,
  });

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionState toQuestionState() => QuestionState(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    userId: userId,
    userName: userName,
    content: content,
    medias: medias,
    image: image,
  );
}