import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination.dart';

@immutable
class TopicState{
  final int id;
  final int subjectId;
  final String name;
  final Pagination questions;

  const TopicState({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.questions
  });

  TopicState getNextPageQuestions()
    => TopicState(
        id: id,
        subjectId: subjectId,
        name: name,
        questions: questions.startLoading(),
      );

  TopicState addNextPageQuestions(Iterable<int> quesionIds)
    => TopicState(
        id: id,
        subjectId: subjectId,
        name: name,
        questions: questions.appendNextPage(quesionIds),
      );
  TopicState addQuestionId(int questionId)
    => TopicState(
        id: id,
        subjectId: subjectId,
        name: name,
        questions: questions.prependOne(questionId)
      );
  TopicState removeQuestionId(int questionId)
    => TopicState(
        id: id,
        subjectId: subjectId,
        name: name,
        questions: questions.removeOne(questionId)
      );
}
