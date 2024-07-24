import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';

@immutable
class QuestionEntityState extends EntityState<QuestionState>{
  const QuestionEntityState({required super.entities});
  
  QuestionEntityState addQuestion(QuestionState value)
    => QuestionEntityState(entities: prependOne(value));
  QuestionEntityState addQuestions(Iterable<QuestionState> values)
    => QuestionEntityState(entities: appendMany(values));
  QuestionEntityState like(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.like()));
  QuestionEntityState dislike(int questionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.dislike()));
    
  QuestionEntityState addQuestionSolution(int questionId,int solutionId)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.addSolution(solutionId)));

  QuestionEntityState nextPageQuestionSolutions(int questionId,Iterable<int> solutionIds)
    => QuestionEntityState(entities: updateOne(entities[questionId]!.nextPageQuestionSolutions(solutionIds)));

  Iterable<QuestionState> getByUserId(int userId)
    => entities.values.where((question) => question.appUserId == userId);
}