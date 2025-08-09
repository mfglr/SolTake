import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/solution_user_vote_state.dart';
part 'solution_user_vote.g.dart';

@JsonSerializable()
@immutable
class SolutionUserVote{
  final int id;
  final int userId;
  final String userName;
  final String? name;
  final Multimedia? image;

  const SolutionUserVote({
    required this.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.image
  });

  factory SolutionUserVote.fromJson(Map<String, dynamic> json) => _$SolutionUserVoteFromJson(json);
  Map<String, dynamic> toJson() => _$SolutionUserVoteToJson(this);


  SolutionUserVoteState toSolutionUserVoteState()
    => SolutionUserVoteState(
        id: id,
        userId: userId,
        userName: userName,
        name: name,
        image: image
      );

}