import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/pagination.dart';

@immutable
class SubjectState{
  final int id;
  final int examId;
  final String name;
  final Pagination topics;
  final Pagination questions;
  
  const SubjectState({
    required this.id,
    required this.examId,
    required this.name,
    required this.topics,
    required this.questions
  });

  SubjectState startLoadingNextQuestions()
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
  SubjectState stopLoadingNextQuestions()
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics,
        questions: questions.stopLoadingNext()
      );

  SubjectState startLoadingPrevQuestions()
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics,
        questions: questions.startLoadingPrev()
      );
  SubjectState addPrevQuestions(Iterable<int> questionIds)
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics,
        questions: questions.addPrevPage(questionIds)
      );
  SubjectState stopLoadingPrevQuestions()
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics,
        questions: questions.stopLoadingPrev()
      );
      
  SubjectState startloadingNextTopics()
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics.startLoadingNext(),
        questions: questions
      );
  SubjectState addNextTopics(Iterable<int> ids)
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics.appendLastPage(ids),
        questions: questions
      );
  SubjectState stopLoadingNextTopics()
    => SubjectState(
        id: id,
        examId: examId,
        name: name,
        topics: topics.stopLoadingNext(),
        questions: questions
      );
}
