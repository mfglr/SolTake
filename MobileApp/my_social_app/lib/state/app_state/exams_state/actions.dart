import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exams_state/exam_state.dart';

@immutable
class NextExamsAction extends AppAction{
  const NextExamsAction();
}
@immutable
class NextExamsSuccessAction extends AppAction{
  final Iterable<ExamState> exams;
  const NextExamsSuccessAction({required this.exams});
}
@immutable
class NextExamsFailedAction extends AppAction{
  const NextExamsFailedAction();
}

@immutable
class RefreshExamsAction extends AppAction{
  const RefreshExamsAction();
}
@immutable
class RefreshExamsSuccessAction extends AppAction{
  final Iterable<ExamState> exams;
  const RefreshExamsSuccessAction({required this.exams});
}
@immutable
class RefreshExamsFailedAction extends AppAction{
  const RefreshExamsFailedAction();
}