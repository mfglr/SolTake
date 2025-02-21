import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/models/avatar.dart';

@immutable
class QuestionUserLikeState implements Avatar{
  final int id;
  final DateTime createdAt;
  final int questionId;
  final int userId;
  final String? name;
  final String userName;
  final Multimedia? image;
  
  @override 
  Multimedia? get avatar => image;
  @override
  int get avatarId => userId;

  const QuestionUserLikeState({
    required this.id,
    required this.createdAt,
    required this.questionId,
    required this.userId,
    required this.name,
    required this.userName,
    required this.image
  });
  
  
}