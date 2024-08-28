import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_user_like_state.dart';
part 'question_user_like.g.dart';

@immutable
@JsonSerializable()
class QuestionUserLike{
  final int id;
  final int appUserId;
  final DateTime createdAt;

  const QuestionUserLike({
    required this.id,
    required this.appUserId,
    required this.createdAt
  });

  factory QuestionUserLike.fromJson(Map<String, dynamic> json) => _$QuestionUserLikeFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionUserLikeToJson(this);

  QuestionUserLikeState toQuestionUserLikeState() => 
    QuestionUserLikeState(
      key: id,
      userId: appUserId,
      createdAt: createdAt
    );
}