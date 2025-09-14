import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/subjects_state/subject_state.dart';

@immutable
class NextExamSubjectsAction extends AppAction{
  final int examId;
  const NextExamSubjectsAction({required this.examId});
}
@immutable
class NextExamSubjectsSuccessAction extends AppAction{
  final int examId;
  final Iterable<SubjectState> subjects;
  const NextExamSubjectsSuccessAction({required this.examId, required this.subjects});
}
@immutable
class NextExamSubjectsFailedAction extends AppAction{
  final int examId;
  const NextExamSubjectsFailedAction({required this.examId});
}

@immutable
class RefreshExamSubjectsAction extends AppAction{
  final int examId;
  const RefreshExamSubjectsAction({required this.examId});
}
@immutable
class RefreshExamSubjectsSuccessAction extends AppAction{
  final int examId;
  final Iterable<SubjectState> subjects;
  const RefreshExamSubjectsSuccessAction({required this.examId, required this.subjects});
}
@immutable
class RefreshExamSubjectsFailedAction extends AppAction{
  final int examId;
  const RefreshExamSubjectsFailedAction({required this.examId});
}


