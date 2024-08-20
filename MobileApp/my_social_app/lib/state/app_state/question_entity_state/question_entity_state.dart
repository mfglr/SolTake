import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/entity_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';

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
    
  QuestionEntityState getNextPageSolutions(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.getNextPageSolutions()));
  QuestionEntityState addNextPageSolutions(int questionId,Iterable<int> solutionIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addNextPageSolutions(solutionIds)));
  QuestionEntityState addSolution(int questionId,int solutionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addSolution(solutionId)));

  QuestionEntityState addComment(int questionId,int questionCommentId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addComment(questionCommentId)));
  QuestionEntityState removeComment(int questionId,int commentId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.removeComment(commentId)));
  QuestionEntityState getNextPageComments(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.getNextPageComments()));
  QuestionEntityState addNextPageComments(int questionId,Iterable<int> commentIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addNextPageComments(commentIds)));

  QuestionEntityState startLoadingImage(int questionId,int index)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.startLoadingImage(index)));
  QuestionEntityState loadImage(int questionId,int index,Uint8List image)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.loadImage(index, image)));
}