import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';

@immutable
class LoadSubjectsByExamIdAction extends redux.Action{
  const LoadSubjectsByExamIdAction();
}

@immutable
class LoadSubjectsByExamIdSuccessAction extends redux.Action{
  final int examId;
  final Iterable<SubjectState> payload;
  const LoadSubjectsByExamIdSuccessAction({required this.examId,required this.payload});
}

@immutable
class LoadSubjectsSuccessAction extends redux.Action{
  final Iterable<SubjectState> subjects;
  const LoadSubjectsSuccessAction({required this.subjects});
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