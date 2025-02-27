import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

@immutable
class TopicState extends BaseEntity<num>{
  final String name;
  final Pagination<num,Id<num>> questions;

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
  TopicState addNextQuestions(Iterable<num> quesionIds)
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
  TopicState addPrevQuestions(Iterable<num> questionIds)
    => TopicState(
        id: id,
        name: name,
        questions: questions.addPrevPage(questionIds.map((questionId) => Id(id: questionId)))
      );
    
  TopicState addQuestionId(num questionId)
    => TopicState(
        id: id,
        name: name,
        questions: questions.prependOne(Id(id: questionId))
      );
  TopicState removeQuestionId(num questionId)
    => TopicState(
        id: id,
        name: name,
        questions: questions.removeOne(questionId)
      );
}
