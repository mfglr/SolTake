import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';

@immutable
class AddSubjectsAction extends redux.Action{
  final Iterable<SubjectState> subjects;
  const AddSubjectsAction({required this.subjects});
}

@immutable
class LoadTopicsOfSelectedSubjectAction extends redux.Action{
  const LoadTopicsOfSelectedSubjectAction();
}
@immutable
class LoadTopicsOfSelectedSubjectSuccessAction extends redux.Action{
  final int subjectId;
  final Iterable<int> topicIds;
  const LoadTopicsOfSelectedSubjectSuccessAction({required this.subjectId, required this.topicIds});
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
@immutable
class NextPageOfSubjectQuestionsIfNoQuestionsAction extends redux.Action{
  final int subjectId;
  const NextPageOfSubjectQuestionsIfNoQuestionsAction({required this.subjectId});
}