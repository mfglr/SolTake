import 'package:flutter/material.dart';
import 'package:my_social_app/packages/entity_state/entity.dart';

@immutable
class TopicRequestState extends Entity<int>{
  final DateTime createdAt;
  final String subjectName;
  final String name;
  final int state;
  final int? reason;

  TopicRequestState({
    required super.id,
    required this.createdAt,
    required this.subjectName,
    required this.name,
    required this.state,
    required this.reason
  });
}