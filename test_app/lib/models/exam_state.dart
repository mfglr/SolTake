import 'package:flutter/material.dart';
import 'package:test_app/state/entity_state/entity.dart';

@immutable
class ExamState extends Entity<int>{
  final String name;
  final String initialism;

  ExamState({
    required super.id,
    required this.name,
    required this.initialism,
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
      );
  ExamState stopLoadingNextQuestions()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
      );
  ExamState addNextQuestions(Iterable<int> questionIds)
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
      );

  ExamState startLoadingPrevQuestions()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
      );
  ExamState stopLoadingPrevQuestions()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
      );
  ExamState addPrevQuestions(Iterable<int> questionIds)
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
      );

  ExamState startLoadingNextSubjects()
    => ExamState(
      id: id,
      name: name,
      initialism: initialism,
    );
  ExamState stopLoadingNextSubjects()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
      );
  ExamState addNextSubjects(Iterable<int> subjectIds)
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
      );
}
