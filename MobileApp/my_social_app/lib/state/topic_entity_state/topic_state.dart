import 'package:flutter/material.dart';
import 'package:my_social_app/state/ids.dart';

@immutable
class TopicState{
  final int id;
  final int subjectId;
  final String name;
  final Ids questions;

  const TopicState({
    required this.id,
    required this.subjectId,
    required this.name,
    required this.questions
  });

  TopicState loadQuestionIds(Iterable<int> quesionIds)
    => TopicState(
        id: id,
        subjectId: subjectId,
        name: name,
        questions: questions.nextPage(quesionIds),
      );
  TopicState addQuestionId(int questionId)
    => TopicState(
        id: id,
        subjectId: subjectId,
        name: name,
        questions: questions.add(questionId)
      );
  TopicState removeQuestionId(int questionId)
    => TopicState(
        id: id,
        subjectId: subjectId,
        name: name,
        questions: questions.remove(questionId)
      );
}
