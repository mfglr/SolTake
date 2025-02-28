import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class SolutionUserVoteState extends BaseEntity<int>{
  final DateTime createdAt;
  final num solutionId;
  final num userId;

  SolutionUserVoteState({
    required super.id,
    required this.createdAt,
    required this.solutionId,
    required this.userId
  });
}