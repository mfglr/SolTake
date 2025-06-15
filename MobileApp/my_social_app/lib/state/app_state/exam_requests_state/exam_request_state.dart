import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

@immutable
class ExamRequestState extends Entity<int>{
  final String name;
  final String initialism;
  final int state;
  
  ExamRequestState({
    required super.id,
    required this.name,
    required this.initialism,
    required this.state
  });
}