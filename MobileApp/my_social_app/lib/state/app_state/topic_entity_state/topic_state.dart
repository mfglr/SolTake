import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class TopicState extends Entity<int>{
  final String name;
  final Pagination<int,Id<int>> questions;

  TopicState({
    required super.id,
    required this.name,
    required this.questions
  });

  TopicState startLoadingNextQuestions()
    => TopicState(
        id: id,
        name: name,
        questions: questions.startLoadingNext(),
      );
  TopicState stopLoadingNextQuestions()
    => TopicState(
      id: id,
      name: name,
      questions: questions.stopLoadingNext()
    );
  TopicState addNextQuestions(Iterable<int> quesionIds)
    => TopicState(
        id: id,
        name: name,
        questions: questions.addNextPage(quesionIds.map((questionId) => Id(id: questionId))),
      );

  TopicState startLoadingPrevQuestions()
    => TopicState(
        id: id,
        name: name,
        questions: questions.startLoadingPrev()
      );
  TopicState stopLoadingPrevQuestions()
    => TopicState(
        id: id,
        name: name,
        questions: questions.stopLoadingPrev()
      );
  TopicState addPrevQuestions(Iterable<int> questionIds)
    => TopicState(
        id: id,
        name: name,
        questions: questions.addPrevPage(questionIds.map((questionId) => Id(id: questionId)))
      );
    
  TopicState addQuestionId(int questionId)
    => TopicState(
        id: id,
        name: name,
        questions: questions.prependOne(Id(id: questionId))
      );
  TopicState removeQuestionId(int questionId)
    => TopicState(
        id: id,
        name: name,
        questions: questions.removeOne(questionId)
      );
}
