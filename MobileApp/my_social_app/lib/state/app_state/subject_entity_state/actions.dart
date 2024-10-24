import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';

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

@immutable
class NextSubjectQuestionsAction extends AppAction{
  final int subjectId;
  const NextSubjectQuestionsAction({required this.subjectId});
}
@immutable
class NextSubjectQuestionsSuccessAction extends AppAction{
  final int subjectId;
  final Iterable<int> questions;
  const NextSubjectQuestionsSuccessAction({required this.subjectId, required this.questions});
}
@immutable
class NextSubjectQuestionsFailedAction extends AppAction{
  final int subjectId;
  const NextSubjectQuestionsFailedAction({required this.subjectId});
}

@immutable
class PrevSubjectQuestionsAction extends AppAction{
  final int subjectId;
  const PrevSubjectQuestionsAction({required this.subjectId});
}
@immutable
class PrevSubjectQuestionsSuccessAction extends AppAction{
  final int subjectId;
  final Iterable<int> questionIds;
  const PrevSubjectQuestionsSuccessAction({required this.subjectId, required this.questionIds});
}
@immutable
class PrevSubjectQuestionsFailedAction extends AppAction{
  final int subjectId;
  const PrevSubjectQuestionsFailedAction({required this.subjectId});
}