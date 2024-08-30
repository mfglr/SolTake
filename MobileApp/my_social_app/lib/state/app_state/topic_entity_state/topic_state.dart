import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/pagination/pagination.dart';

@immutable
class TopicState extends Entity{
  final int subjectId;
  final String name;
  final Pagination questions;

  const TopicState({
    required super.id,
    required this.subjectId,
    required this.name,
    required this.questions
  });

  TopicState getNextPageQuestions()
    => TopicState(
        id: id,
        subjectId: subjectId,
        name: name,
        questions: questions.startLoadingNext(),
      );

  TopicState addNextPageQuestions(Iterable<int> quesionIds)
    => TopicState(
        id: id,
        subjectId: subjectId,
        name: name,
        questions: questions.addNextPage(quesionIds),
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
