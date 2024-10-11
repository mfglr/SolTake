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

  ExamState startLoadingNextQuestions()
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects,
        questions: questions.startLoadingNext()
      );
  ExamState stopLoadingNextQuestions()
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects,
        questions: questions.stopLoadingNext()
      );
  ExamState addNextQuestions(Iterable<int> questionIds)
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects,
        questions: questions.addNextPage(questionIds)
      );

  ExamState startLoadingPrevQuestions()
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects,
        questions: questions.startLoadingPrev()
      );
  ExamState stopLoadingPrevQuestions()
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects,
        questions: questions.stopLoadingPrev()
      );
  ExamState addPrevQuestions(Iterable<int> questionIds)
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects,
        questions: questions.addPrevPage(questionIds)
      );

  ExamState startLoadingNextSubjects()
    => ExamState(
      id: id,
      shortName: shortName,
      fullName: fullName,
      subjects: subjects.startLoadingNext(),
      questions: questions
    );
  ExamState stopLoadingNextSubjects()
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects.stopLoadingNext(),
        questions: questions
      );
  ExamState addNextSubjects(Iterable<int> subjectIds)
    => ExamState(
        id: id,
        shortName: shortName,
        fullName: fullName,
        subjects: subjects.addNextPage(subjectIds),
        questions: questions
      );
}
