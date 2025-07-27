import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';
import 'package:my_social_app/state/app_state/subjects_state/selectors.dart';
import 'package:my_social_app/state/entity_state/pagination_state/map_extentions.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';

@immutable
class SubjectsState {
  final Map<int, Pagination<int, SubjectState>> examSubjects;

  const SubjectsState({
    required this.examSubjects
  });

  //exams subjects
  SubjectsState startLoadingNextExamSubjects(int examId) =>
    SubjectsState(
      examSubjects: examSubjects.setOne(
        examId,
        selectExamSubjectsFromState(this, examId).startLoadingNext()
      )
    );
  SubjectsState addNextPageExamSubjects(int examId, Iterable<SubjectState> subjects) =>
    SubjectsState(
      examSubjects: examSubjects.setOne(
        examId,
        selectExamSubjectsFromState(this, examId).addNextPage(subjects)
      )
    );
  SubjectsState refreshExamSubjects(int examId, Iterable<SubjectState> subjects) =>
    SubjectsState(
      examSubjects: examSubjects.setOne(
        examId,
        selectExamSubjectsFromState(this, examId).refreshPage(subjects)
      )
    );
  SubjectsState stopLoadingNextExamSubjects(int examId) =>
    SubjectsState(
      examSubjects: examSubjects.setOne(
        examId,
        selectExamSubjectsFromState(this, examId).stopLoadingNext()
      )
    );
  //exams subjects
}