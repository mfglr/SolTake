import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';

@immutable
class AddSubjectsAction extends redux.Action{
  final Iterable<SubjectState> subjects;
  const AddSubjectsAction({required this.subjects});
}

@immutable
class NextPageOfSubjectQuestionsAction extends redux.Action{
  final int subjectId;
  const NextPageOfSubjectQuestionsAction({required this.subjectId});
}
@immutable
class NextPageOfSubjectQuestionsSuccessAction extends redux.Action{
  final int subjectId;
  final Iterable<int> questions;
  const NextPageOfSubjectQuestionsSuccessAction({required this.subjectId, required this.questions});
}