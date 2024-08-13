import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/subject_entity_state/subject_state.dart';

@immutable
class AddSubjectsAction extends redux.Action{
  final Iterable<SubjectState> subjects;
  const AddSubjectsAction({required this.subjects});
}

@immutable
class GetSubjectTopicsAction extends redux.Action{
  final int subjectId;
  const GetSubjectTopicsAction({required this.subjectId});
}
@immutable
class GetTopicsOfSelectedSubjectAction extends redux.Action{
  const GetTopicsOfSelectedSubjectAction();
}
@immutable
class GetSubjectTopicsSuccessAction extends redux.Action{
  final int subjectId;
  final Iterable<int> topicIds;
  const GetSubjectTopicsSuccessAction({required this.subjectId, required this.topicIds});
}

@immutable
class GetNextPageSubjectQuestionsIfNoPageAction extends redux.Action{
  final int subjectId;
  const GetNextPageSubjectQuestionsIfNoPageAction({required this.subjectId});
}
@immutable
class GetNextPageSubjectQuestionsIfReadyAction extends redux.Action{
  final int subjectId;
  const GetNextPageSubjectQuestionsIfReadyAction({required this.subjectId});
}
@immutable
class GetNextPageSubjectQuestionsAction extends redux.Action{
  final int subjectId;
  const GetNextPageSubjectQuestionsAction({required this.subjectId});
}
@immutable
class AddNextPageSubjectQuestionsAction extends redux.Action{
  final int subjectId;
  final Iterable<int> questions;
  const AddNextPageSubjectQuestionsAction({required this.subjectId, required this.questions});
}
