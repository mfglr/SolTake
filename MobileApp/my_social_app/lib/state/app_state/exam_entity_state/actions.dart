import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';

@immutable
class LoadExamAction extends AppAction{
  final int examId;
  const LoadExamAction({required this.examId});
}

@immutable
class AddExamAction extends AppAction{
  final ExamState exam;
  const AddExamAction({required this.exam});
}
@immutable
class AddExamsAction extends AppAction{
  final Iterable<ExamState> exams;
  const AddExamsAction({ required this.exams });
}

