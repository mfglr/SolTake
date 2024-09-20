import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';

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
class GetNextPageSubjectTopicsIfNoPageAction extends AppAction{
  final int subjectId;
  const GetNextPageSubjectTopicsIfNoPageAction({required this.subjectId});
}
@immutable
class GetNextPageSubjectTopicsAction extends AppAction{
  final int subjectId;
  const GetNextPageSubjectTopicsAction({required this.subjectId});
}
@immutable
class AddNextPageSubjectTopicsAction extends AppAction{
  final int subjectId;
  final Iterable<int> topicIds;
  const AddNextPageSubjectTopicsAction({required this.subjectId, required this.topicIds});
}

@immutable
class GetNextPageSubjectQuestionsIfNoPageAction extends AppAction{
  final int subjectId;
  const GetNextPageSubjectQuestionsIfNoPageAction({required this.subjectId});
}
@immutable
class GetNextPageSubjectQuestionsIfReadyAction extends AppAction{
  final int subjectId;
  const GetNextPageSubjectQuestionsIfReadyAction({required this.subjectId});
}
@immutable
class GetNextPageSubjectQuestionsAction extends AppAction{
  final int subjectId;
  const GetNextPageSubjectQuestionsAction({required this.subjectId});
}
@immutable
class AddNextPageSubjectQuestionsAction extends AppAction{
  final int subjectId;
  final Iterable<int> questions;
  const AddNextPageSubjectQuestionsAction({required this.subjectId, required this.questions});
}

@immutable
class GetPrevPageSubjectQuestionsIfReadyAction extends AppAction{
  final int subjectId;
  const GetPrevPageSubjectQuestionsIfReadyAction({required this.subjectId});
}
@immutable
class GetPrevPageSubjectQuestionsAction extends AppAction{
  final int subjectId;
  const GetPrevPageSubjectQuestionsAction({required this.subjectId});
}
@immutable
class AddPrevPageSubjectQuestionsAction extends AppAction{
  final int subjectId;
  final Iterable<int> questionIds;
  const AddPrevPageSubjectQuestionsAction({required this.subjectId, required this.questionIds});
}