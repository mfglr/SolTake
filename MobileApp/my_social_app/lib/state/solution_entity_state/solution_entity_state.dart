import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';

@immutable
class SolutionEntityState extends EntityState<SolutionState>{
  const SolutionEntityState({required super.entities});

  SolutionEntityState makeUpvote(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]!.makeUpvote()));
  SolutionEntityState makeDownvote(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]!.makeDownvote()));
  SolutionEntityState removeUpvote(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]!.removeUpvote()));
  SolutionEntityState removeDownvote(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]!.removeDownvote()));

  SolutionEntityState addSolutionComment(int solutionId, int commentId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]!.addComment(commentId)));
}