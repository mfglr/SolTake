import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

@immutable
class SubjectState extends BaseEntity<int>{
  final String name;
  final Pagination<num,Id<num>> topics;
  final Pagination<num,Id<num>> questions;
  
  SubjectState({
    required super.id,
    required this.name,
    required this.topics,
    required this.questions
  });

  SubjectState startLoadingNextQuestions()
    => SubjectState(
        id: id,
        name: name,
        topics: topics,
        questions: questions.startLoadingNext()
      );
  SubjectState addNextPageQuestions(Iterable<num> ids)
    => SubjectState(
        id: id,
        name: name,
        topics: topics,
        questions: questions.addNextPage(ids.map((e) => Id(id: e)))
      );
  SubjectState stopLoadingNextQuestions()
    => SubjectState(
        id: id,
        name: name,
        topics: topics,
        questions: questions.stopLoadingNext()
      );

  SubjectState startLoadingPrevQuestions()
    => SubjectState(
        id: id,
        name: name,
        topics: topics,
        questions: questions.startLoadingPrev()
      );
  SubjectState addPrevQuestions(Iterable<num> questionIds)
    => SubjectState(
        id: id,
        name: name,
        topics: topics,
        questions: questions.addPrevPage(questionIds.map((e) => Id(id: e)))
      );
  SubjectState stopLoadingPrevQuestions()
    => SubjectState(
        id: id,
        name: name,
        topics: topics,
        questions: questions.stopLoadingPrev()
      );
      
  SubjectState startLoadingNextTopics()
    => SubjectState(
        id: id,
        name: name,
        topics: topics.startLoadingNext(),
        questions: questions
      );
  SubjectState addNextTopics(Iterable<num> ids)
    => SubjectState(
        id: id,
        name: name,
        topics: topics.appendLastPage(ids.map((e) => Id(id: e))),
        questions: questions
      );
  SubjectState stopLoadingNextTopics()
    => SubjectState(
        id: id,
        name: name,
        topics: topics.stopLoadingNext(),
        questions: questions
      );
}
