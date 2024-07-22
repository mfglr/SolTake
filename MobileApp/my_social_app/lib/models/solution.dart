import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/solution_image.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
part 'solution.g.dart';


@immutable
@JsonSerializable()
class Solution{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int questionId;
  final int appUserId;
  final String userName;
  final String content;
  final int state;
  final int numberOfUpvotes;
  final int numberOfDownvotes;
  final bool isOwner;
  final Iterable<SolutionImage> images;

  const Solution({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.questionId,
    required this.appUserId,
    required this.userName,
    required this.content,
    required this.state,
    required this.numberOfUpvotes,
    required this.numberOfDownvotes,
    required this.isOwner,
    required this.images
  });

  factory Solution.fromJson(Map<String, dynamic> json) => _$SolutionFromJson(json);
  Map<String, dynamic> toJson() => _$SolutionToJson(this);

  SolutionState toSolutionState()
   => SolutionState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      questionId: questionId,
      appUserId: appUserId,
      userName: userName,
      content: content,
      state: state,
      numberOfUpvotes: numberOfUpvotes,
      numberOfDownvotes: numberOfDownvotes,
      isOwner: isOwner,
      solutionImages: images.map((e) => e.id)
    );
}