import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';

@immutable
class ExamState extends BaseEntity<int>{
  final String shortName;
  final String fullName;
  final Pagination<int,Id<int>> subjects;
  final Pagination<int,Id<int>> questions;

  ExamState({
    required super.id,
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
        questions: questions.addNextPage(questionIds.map((questionId) => Id(id: questionId)))
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
        questions: questions.addPrevPage(questionIds.map((questionId) => Id(id: questionId)))
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
        subjects: subjects.addNextPage(subjectIds.map((subjectId) => Id(id: subjectId))),
        questions: questions
      );
}
