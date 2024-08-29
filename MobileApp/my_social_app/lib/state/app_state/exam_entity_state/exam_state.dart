import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/pagination.dart';

@immutable
class ExamState{
  final int id;
  final String shortName;
  final String fullName;
  final Pagination subjects;
  final Pagination questions;

  const ExamState({
    required this.id,
    required this.shortName,
    required this.fullName,
    required this.subjects,
    required this.questions
  });

  ExamState getNextPageQuestions()
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects,
        questions: questions.startLoadingNext()
      );
  ExamState addNextPageQuestions(Iterable<int> questionIds)
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects,
        questions: questions.addNextPage(questionIds)
      );

  ExamState getNextPageSubjects(){
    if(subjects.isLast || subjects.loadingNext) return this;
    return ExamState(
      id: id,
      shortName: shortName,
      fullName: fullName,
      subjects: subjects.startLoadingNext(),
      questions: questions
    );
  }
  ExamState addNextPageSubjects(Iterable<int> ids)
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects.appendLastPage(ids),
        questions: questions
      );
}
