import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';

@immutable
class QuestionUserLikeState{
  final int id;
  final DateTime likedAt;
  final int questionId;
  final int userId;
  final String? name;
  final String userName;
  final Multimedia image;
  
  const QuestionUserLikeState({
    required this.id,
    required this.likedAt,
    required this.questionId,
    required this.userId,
    required this.name,
    required this.userName,
    required this.image
  });
}