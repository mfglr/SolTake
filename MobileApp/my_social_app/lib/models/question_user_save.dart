import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/question.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/question_user_save_state.dart';
part 'question_user_save.g.dart';

@JsonSerializable()
@immutable
class QuestionUserSave{
  final int id;
  final Question question;

  const QuestionUserSave({
    required this.id,
    required this.question
  });

  factory QuestionUserSave.fromJson(Map<String, dynamic> json) => _$QuestionUserSaveFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionUserSaveToJson(this);

  QuestionUserSaveState toQuestionUserSaveState() =>
    QuestionUserSaveState(
      id: id,
      questionId: question.id,
    );
}