import 'package:flutter/material.dart';
import 'package:my_social_app/custom_packages/entity_state/entity.dart';

@immutable
class SubjectState extends Entity<int>{
  final String name;
  
  SubjectState({
    required super.id,
    required this.name,
  });

  @override
  String toString() => name;
}
