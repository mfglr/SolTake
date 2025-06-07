import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:soltake_broker/state/entity_state/entity.dart';

@immutable
class QuestionState extends Entity<int>{
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int userId;
  final String userName;
  final String? content;
  final Iterable<Multimedia> medias;
  final Multimedia? image;

  QuestionState({
    required super.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.userName,
    required this.content,
    required this.medias,
    required this.image,
  });
}
