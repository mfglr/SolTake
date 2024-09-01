import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/entity_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class SolutionEntityState extends EntityState<SolutionState>{
  const SolutionEntityState({required super.entities});

  SolutionEntityState startLoadinNextUpvotes(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.startLoadingNextUpvotes()));
  SolutionEntityState addNextPageUpvotes(int solutionId, Iterable<int> voteIds)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.addNextPageUpvotes(voteIds)));
  SolutionEntityState makeUpvote(int solutionId,int upvoteId,int downvoteId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.makeUpvote(upvoteId,downvoteId)));
  SolutionEntityState removeUpvote(int solutionId,int voteId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.removeUpvote(voteId)));
  
  SolutionEntityState starLoadingNextDownvotes(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.startLoadingNextDownvotes()));
  SolutionEntityState addNextPageDownvotes(int solutionId,Iterable<int> voteIds)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.addNextPageDownvotes(voteIds)));
  SolutionEntityState makeDownvote(int solutionId,int upvoteId,int downvoteId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.makeDownvote(upvoteId,downvoteId)));
  SolutionEntityState removeDownvote(int solutionId,int voteId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.removeDownvote(voteId)));
  
  SolutionEntityState getNextPageComments(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.getNextPageComments()));
  SolutionEntityState addNextPageComments(int solutionId, Iterable<int> commentIds)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.addNextPageComments(commentIds)));
  SolutionEntityState addComment(int solutionId, int commentId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.addComment(commentId)));
  SolutionEntityState removeComment(int solutionId,int commentId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.removeComment(commentId)));

  SolutionEntityState startLoadingImage(int solutionId,int index)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.startLoadingImage(index)));
  SolutionEntityState loadImage(int solutionId,int index,Uint8List image)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.loadImage(index, image)));

  SolutionEntityState markAsCorrect(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.markAsCorrect()));
  SolutionEntityState markAsIncorrect(int solutionId)
    => SolutionEntityState(entities: updateOne(entities[solutionId]?.markAsIncorrect()));
  
}