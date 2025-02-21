import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/question_user_like_entity_state/question_user_like_state.dart';
part 'question_user_like.g.dart';

@immutable
@JsonSerializable()
class QuestionUserLike{
  final int id;
  final DateTime createdAt;
  final int questionId;
  final int userId;
  final String? name;
  final String userName;
  final Multimedia? image;
  
  const QuestionUserLike({
    required this.id,
    required this.createdAt,
    required this.questionId,
    required this.userId,
    required this.name,
    required this.userName,
    required this.image
  });

  factory QuestionUserLike.fromJson(Map<String, dynamic> json) => _$QuestionUserLikeFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionUserLikeToJson(this);

  QuestionUserLikeState toQuestionUserLikeState()
    => QuestionUserLikeState(
        id: id,
        createdAt: createdAt,
        questionId: questionId,
        userId: userId,
        name: name,
        userName: userName,
        image: image
      );
}