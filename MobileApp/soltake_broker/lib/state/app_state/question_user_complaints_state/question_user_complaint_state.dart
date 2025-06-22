import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:soltake_broker/state/entity_state/entity.dart';

@immutable
class QuestionUserComplaintState extends Entity<int>{
  final DateTime createdAt;
  final int reason;
  final String? content;
  final Iterable<Multimedia> medias;
  final String? questionContent;

  QuestionUserComplaintState({
    required super.id,
    required this.createdAt,
    required this.reason,
    required this.content,
    required this.medias,
    required this.questionContent
  });
}