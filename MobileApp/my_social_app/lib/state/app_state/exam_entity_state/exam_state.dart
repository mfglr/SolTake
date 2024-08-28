import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/id_state.dart';
import 'package:my_social_app/state/pagination/pagination.dart';

@immutable
class ExamState{
  final int id;
  final String shortName;
  final String fullName;
  final Pagination<num,IdState> subjects;
  final Pagination<num,IdState> questions;

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
  ExamState addNextPageQuestions(Iterable<IdState> questionIds)
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
  ExamState addNextPageSubjects(Iterable<IdState> ids)
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects.appendLastPage(ids),
        questions: questions
      );
}
