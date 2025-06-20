import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

@immutable
class ExamRequestState extends Entity<int>{
  final DateTime createdAt;
  final String name;
  final String initialism;
  final int state;
  final int? reason;
  
  ExamRequestState({
    required super.id,
    required this.createdAt,
    required this.name,
    required this.initialism,
    required this.state,
    required this.reason
  });
}