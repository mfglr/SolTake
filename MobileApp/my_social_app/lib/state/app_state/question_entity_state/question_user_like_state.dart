import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/models/avatar.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class QuestionUserLikeState extends BaseEntity<int> implements Avatar{
  final DateTime createdAt;
  final num questionId;
  final int userId;
  final String? name;
  final String userName;
  final Multimedia? image;
  
  @override 
  Multimedia? get avatar => image;
  @override
  int get avatarId => userId;

  QuestionUserLikeState({
    required super.id,
    required this.createdAt,
    required this.questionId,
    required this.userId,
    required this.name,
    required this.userName,
    required this.image
  });
  
}