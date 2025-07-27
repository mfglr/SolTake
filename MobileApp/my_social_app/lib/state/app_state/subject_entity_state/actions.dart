import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/subjects_state/subject_state.dart';

@immutable
class LoadSubjectAction extends AppAction{
  final int subjectId;
  const LoadSubjectAction({required this.subjectId});
}
@immutable
class AddSubjectAction extends AppAction{
  final SubjectState subject;
  const AddSubjectAction({required this.subject});
}
@immutable
class AddSubjectsAction extends AppAction{
  final Iterable<SubjectState> subjects;
  const AddSubjectsAction({required this.subjects});
}

@immutable
class NextSubjectTopicsAction extends AppAction{
  final int subjectId;
  const NextSubjectTopicsAction({required this.subjectId});
}
@immutable
class NextSubjectTopicsSuccessAction extends AppAction{
  final int subjectId;
  final Iterable<int> topicIds;
  const NextSubjectTopicsSuccessAction({required this.subjectId, required this.topicIds});
}
@immutable
class NextSubjectTopicsFailedAction extends AppAction{
  final int subjectId;
  const NextSubjectTopicsFailedAction({required this.subjectId});
}