import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class SolutionEntityState extends EntityState<SolutionState>{
  const SolutionEntityState({required super.containers});

  SolutionEntityState makeUpvote(int solutionId)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.makeUpvote()));
  SolutionEntityState makeDownvote(int solutionId)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.makeDownvote()));
  SolutionEntityState removeUpvote(int solutionId)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.removeUpvote()));
  SolutionEntityState removeDownvote(int solutionId)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.removeDownvote()));
  
  SolutionEntityState getNextPageComments(int solutionId)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.getNextPageComments()));
  SolutionEntityState addNextPageComments(int solutionId, Iterable<int> commentIds)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.addNextPageComments(commentIds)));
  SolutionEntityState addComment(int solutionId, int commentId)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.addComment(commentId)));
  SolutionEntityState removeComment(int solutionId,int commentId)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.removeComment(commentId)));

  SolutionEntityState startLoadingImage(int solutionId,int index)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.startLoadingImage(index)));
  SolutionEntityState loadImage(int solutionId,int index,Uint8List image)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.loadImage(index, image)));

  SolutionEntityState markAsCorrect(int solutionId)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.markAsCorrect()));
  SolutionEntityState markAsIncorrect(int solutionId)
    => SolutionEntityState(containers: updateOne(containers[solutionId]?.entity.markAsIncorrect()));
}