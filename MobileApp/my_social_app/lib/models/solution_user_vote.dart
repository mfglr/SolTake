import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/state/app_state/solution_user_vote_entity_state/solution_user_vote_state.dart';
part 'solution_user_vote.g.dart';

@JsonSerializable()
@immutable
class SolutionUserVote{
  final int id;
  final DateTime createdAt;
  final int solutionId;
  final int userId;
  final User? appUser;

  const SolutionUserVote({
    required this.id,
    required this.createdAt,
    required this.solutionId,
    required this.userId,
    required this.appUser
  });

  factory SolutionUserVote.fromJson(Map<String, dynamic> json) => _$SolutionUserVoteFromJson(json);
  Map<String, dynamic> toJson() => _$SolutionUserVoteToJson(this);


  SolutionUserVoteState toSolutionUserVoteState()
    => SolutionUserVoteState(
        id: id,
        createdAt: createdAt,
        solutionId: solutionId,
        userId: userId
      );

}