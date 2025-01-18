import 'package:flutter/material.dart';

@immutable
class QuestionUserLikeState{
  final int id;
  final int questionId;
  final int userId;
  final DateTime createdAt;
  
  const QuestionUserLikeState({
    required this.id,
    required this.questionId,
    required this.userId,
    required this.createdAt
  });
}