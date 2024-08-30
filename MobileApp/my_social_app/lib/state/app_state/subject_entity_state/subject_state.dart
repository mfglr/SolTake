import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/ids.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/pagination/pagination.dart';

@immutable
class SubjectState extends Entity{
  final int examId;
  final String name;
  final Ids topics;
  final Pagination questions;
  
  const SubjectState({
    required super.id,
    required this.examId,
    required this.name,
    required this.topics,
    required this.questions
  });

  SubjectState getNextPageQuestions()
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics,
        questions: questions.startLoadingNext()
      );
  SubjectState addNextPageQuestions(Iterable<int> ids)
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics,
        questions: questions.addNextPage(ids)
      );

  SubjectState loadTopics(Iterable<int> ids)
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics.lastPage(ids),
        questions: questions
      );
}
