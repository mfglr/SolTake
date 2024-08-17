import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';

@immutable
class GetAllExamsAction extends redux.Action{
  const GetAllExamsAction();
}
@immutable
class AddAllExamsAction extends redux.Action{
  final Iterable<ExamState> exams;
  const AddAllExamsAction({required this.exams});
}
@immutable
class AddExamAction extends redux.Action{
  final ExamState exam;
  const AddExamAction({required this.exam});
}
@immutable
class AddExamsAction extends redux.Action{
  final Iterable<ExamState> exams;
  const AddExamsAction({ required this.exams });
}

@immutable
class GetNextPageExamQuestionsIfNoPageAction extends redux.Action{
  final int examId;
  const GetNextPageExamQuestionsIfNoPageAction({required this.examId});
}
@immutable
class GetNextPageExamQuestionsIfReadyAction extends redux.Action{
  final int examId;
  const GetNextPageExamQuestionsIfReadyAction({required this.examId});
}
@immutable
class GetNextPageExamQuestionsAction extends redux.Action{
  final int examId;
  const GetNextPageExamQuestionsAction({required this.examId});
}
@immutable
class AddNextPageExamQuestionsAction extends redux.Action{
  final int examId;
  final Iterable<int> questionIds;
  const AddNextPageExamQuestionsAction({required this.examId, required this.questionIds});
}

@immutable
class GetExamSubjectsAction extends redux.Action{
  final int examId;
  const GetExamSubjectsAction({required this.examId});
}
@immutable
class GetSubjectsOfSelectedExamAction extends redux.Action{
  const GetSubjectsOfSelectedExamAction();
}
@immutable
class GetExamSubjectsSuccessAction extends redux.Action{
  final int examId;
  final Iterable<int> ids;
  const GetExamSubjectsSuccessAction({
    required this.examId,
    required this.ids
  });
}
