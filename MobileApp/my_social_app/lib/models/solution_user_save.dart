import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/solution.dart';
import 'package:my_social_app/state/app_state/solution_user_save_entity_state/solution_user_save_state.dart';
part 'solution_user_save.g.dart';

@JsonSerializable()
@immutable
class SolutionUserSave{
  final int id;
  final DateTime createdAt;
  final int solutionId;
  final int userId;
  final Solution? solution;

  const SolutionUserSave({
    required this.id,
    required this.createdAt,
    required this.solutionId,
    required this.userId,
    required this.solution
  });

  factory SolutionUserSave.fromJson(Map<String, dynamic> json) => _$SolutionUserSaveFromJson(json);
  Map<String, dynamic> toJson() => _$SolutionUserSaveToJson(this);

  SolutionUserSaveState toSolutionUserSaveState() =>
    SolutionUserSaveState(
      id: id,
      createdAt: createdAt,
      solutionId: solutionId,
      userId: userId
    );

}