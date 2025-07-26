import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/entity.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class ExamState extends Entity<int>{
  final String name;
  final String initialism;
  final Pagination<int,Id<int>> subjects;

  ExamState({
    required super.id,
    required this.name,
    required this.initialism,
    required this.subjects,
  });

  @override
  String toString() {
    return name;
  }
  
  ExamState startLoadingNextSubjects()
    => ExamState(
      id: id,
      name: name,
      initialism: initialism,
      subjects: subjects.startLoadingNext(),
    );
  ExamState stopLoadingNextSubjects()
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects.stopLoadingNext(),
      );
  ExamState addNextSubjects(Iterable<int> subjectIds)
    => ExamState(
        id: id,
        name: name,
        initialism: initialism,
        subjects: subjects.addNextPage(subjectIds.map((subjectId) => Id(id: subjectId))),
      );
}
