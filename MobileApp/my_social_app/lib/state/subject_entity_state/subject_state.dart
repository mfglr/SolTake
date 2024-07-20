import 'package:flutter/material.dart';
import 'package:my_social_app/state/ids.dart';

@immutable
class SubjectState{
  final int id;
  final int examId;
  final String name;
  final Ids topics;
  final Ids questions;
  
  const SubjectState({
    required this.id,
    required this.examId,
    required this.name,
    required this.topics,
    required this.questions
  });


  SubjectState nextPageOfQuestions(Iterable<int> ids)
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics,
        questions: questions.nextPage(ids)
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
