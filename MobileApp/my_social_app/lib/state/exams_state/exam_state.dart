import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';

@immutable
class ExamState extends Entity<int>{
  final String name;
  final String initialism;

  ExamState({
    required super.id,
    required this.name,
    required this.initialism,
  });

  @override
  String toString() => initialism;
}
