import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

@immutable
class QuestionUserLikeState extends Entity{
  final DateTime createdAt;
  final int questionId;
  final int appUserId;
  
  const QuestionUserLikeState({
    required super.id,
    required this.createdAt,
    required this.questionId,
    required this.appUserId,
  });
}