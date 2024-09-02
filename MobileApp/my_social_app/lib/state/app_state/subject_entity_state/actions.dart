import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/subject_entity_state/subject_state.dart';

@immutable
class AddSubjectAction extends redux.Action{
  final SubjectState subject;
  const AddSubjectAction({required this.subject});
}
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

@immutable
class GetPrevPageSubjectQuestionsIfReadyAction extends redux.Action{
  final int subjectId;
  const GetPrevPageSubjectQuestionsIfReadyAction({required this.subjectId});
}
@immutable
class GetPrevPageSubjectQuestionsAction extends redux.Action{
  final int subjectId;
  const GetPrevPageSubjectQuestionsAction({required this.subjectId});
}
@immutable
class AddPrevPageSubjectQuestionsAction extends redux.Action{
  final int subjectId;
  final Iterable<int> questionIds;
  const AddPrevPageSubjectQuestionsAction({required this.subjectId, required this.questionIds});
}