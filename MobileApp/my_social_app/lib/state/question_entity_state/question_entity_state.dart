import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';

@immutable
class QuestionEntityState extends EntityState<QuestionState>{
  const QuestionEntityState({required super.entities});
  
  QuestionEntityState addQuestion(QuestionState value)
    => QuestionEntityState(entities: appendOne(value));
  QuestionEntityState addQuestions(Iterable<QuestionState> values)
    => QuestionEntityState(entities: appendMany(values));
  QuestionEntityState like(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.like()));
  QuestionEntityState dislike(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.dislike()));
    
  QuestionEntityState getNextPageSolutions(int offset,int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.getNextPageSolutions(offset)));
  QuestionEntityState addNextPageSolutions(int offset,int questionId,Iterable<int> solutionIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addNextPageSolutions(offset,solutionIds)));
  QuestionEntityState addSolution(int offset,int questionId,int solutionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addSolution(offset,solutionId)));
  QuestionEntityState addSolutionPagination(int offset,int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addSolutionPagination(offset)));

  QuestionEntityState addComment(int offset, int questionId,int questionCommentId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addComment(offset,questionCommentId)));
  QuestionEntityState getNextPageComments(int offset, int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.getNextPageComments(offset)));
  QuestionEntityState addNextPageComments(int offset,int questionId,Iterable<int> commentIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addNextPageComments(offset, commentIds)));
  QuestionEntityState addCommentsPagination(int offset,int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addCommentsPagination(offset)));

  QuestionEntityState startLoadingImage(int questionId,int index)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.startLoadingImage(index)));
  QuestionEntityState loadImage(int questionId,int index,Uint8List image)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.loadImage(index, image)));
}