import 'package:flutter/material.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';

@immutable
class QuestionEntityState{
  final Map<int,QuestionState> questions;
  const QuestionEntityState({required this.questions});
  
  QuestionEntityState addQuestion(QuestionState value){
    if(questions[value.id] != null) return this;

    final Map<int,QuestionState> clone = {};
    clone.addEntries([MapEntry(value.id, value)]);
    clone.addAll(questions);
    return QuestionEntityState(questions: clone);
  }
  QuestionEntityState addQuestions(Iterable<QuestionState> values){
    final Map<int,QuestionState> clone = {};
    final notAvailables = values.where((question) => questions[question.id] == null);
    clone.addAll(questions);
    clone.addEntries(notAvailables.map((e) => MapEntry(e.id, e)));
    return QuestionEntityState(questions: clone);
  }


  QuestionEntityState like(int questionId){
    final Map<int,QuestionState> clone = {};
    clone.addAll(questions);
    clone[questionId] = clone[questionId]!.like();
    return QuestionEntityState(questions: clone);
  }
  QuestionEntityState dislike(int questionId){
    final Map<int,QuestionState> clone = {};
    clone.addAll(questions);
    clone[questionId] = clone[questionId]!.dislike();
    return QuestionEntityState(questions: clone);
  }

  Iterable<QuestionState> getByUserId(int userId)
    => questions.values.where((question) => question.appUserId == userId);
  Iterable<QuestionState> getByTopicId(int topicId)
    => questions.values.where((question) => question.topics.any((id) => id == topicId));
  Iterable<QuestionState> getBySubjectId(int subjectId)
    => questions.values.where((question) => question.subjectId == subjectId);
}