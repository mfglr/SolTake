import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class ExamState extends Entity<int>{
  final String name;
  final String initialism;
  final Pagination<int,Id<int>> subjects;
  final Pagination<int,Id<int>> questions;

  ExamState({
    required super.id,
    required this.name,
    required this.initialism,
    required this.subjects,
    required this.questions
  });

  @override
  String toString() {
    return name;
  }

  ExamState startLoadingNextQuestions()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects,
        questions: questions.startLoadingNext()
      );
  ExamState stopLoadingNextQuestions()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects,
        questions: questions.stopLoadingNext()
      );
  ExamState addNextQuestions(Iterable<int> questionIds)
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects,
        questions: questions.addNextPage(questionIds.map((questionId) => Id(id: questionId)))
      );

  ExamState startLoadingPrevQuestions()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects,
        questions: questions.startLoadingPrev()
      );
  ExamState stopLoadingPrevQuestions()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects,
        questions: questions.stopLoadingPrev()
      );
  ExamState addPrevQuestions(Iterable<int> questionIds)
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects,
        questions: questions.addPrevPage(questionIds.map((questionId) => Id(id: questionId)))
      );

  ExamState startLoadingNextSubjects()
    => ExamState(
      id: id,
      name: name,
      initialism: initialism,
      subjects: subjects.startLoadingNext(),
      questions: questions
    );
  ExamState stopLoadingNextSubjects()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects.stopLoadingNext(),
        questions: questions
      );
  ExamState addNextSubjects(Iterable<int> subjectIds)
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects.addNextPage(subjectIds.map((subjectId) => Id(id: subjectId))),
        questions: questions
      );
}
