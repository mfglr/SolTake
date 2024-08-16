import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/entity_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

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
  SolutionEntityState getNextPageComments(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]!.getNextPageComments()));
  SolutionEntityState addNextPageComments(int solutionId, Iterable<int> commentIds)
    => SolutionEntityState(entities: updateOne(entities[solutionId]!.addNextPageComments(commentIds)));

  SolutionEntityState startLoadingImage(int solutionId,int index)
    => SolutionEntityState(entities: updateOne(entities[solutionId]!.startLoadingImage(index)));
  SolutionEntityState loadImage(int solutionId,int index,Uint8List image)
    => SolutionEntityState(entities: updateOne(entities[solutionId]!.loadImage(index, image)));

  Iterable<SolutionState> selectSolutionsByQuestionId(int questionId)
    => entities.values.where((e) => e.questionId == questionId).sorted((x,y) => y.id.compareTo(x.id));
}