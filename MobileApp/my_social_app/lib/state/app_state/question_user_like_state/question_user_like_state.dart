import 'package:flutter/material.dart';

@immutable
class QuestionUserLikeState{
  final int id;
  final int questionId;
  final int appUserId;
  final DateTime createdAt;
  
  const QuestionUserLikeState({
    required this.id,
    required this.questionId,
    required this.appUserId,
    required this.createdAt
  });
}