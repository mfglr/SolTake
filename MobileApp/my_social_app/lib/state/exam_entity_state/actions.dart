import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';

@immutable
class LoadAllExamsAction extends redux.Action{
  const LoadAllExamsAction();
}
@immutable
class LoadAllExamsSuccessAction extends redux.Action{
  final Iterable<ExamState> exams;
  const LoadAllExamsSuccessAction({required this.exams});
}


@immutable
class NextPageOfExamQuestionsAction extends redux.Action{
  final int examId;
  const NextPageOfExamQuestionsAction({required this.examId});
}
@immutable
class NextPageOfExamQuestionsSuccessAction extends redux.Action{
  final int examId;
  final Iterable<int> questionIds;
  const NextPageOfExamQuestionsSuccessAction({required this.examId, required this.questionIds});
}



@immutable
class AddExamsAction extends redux.Action{
  final Iterable<ExamState> exams;
  const AddExamsAction({ required this.exams });
}



@immutable
class LoadSubjectsOfSelectedExamAction extends redux.Action{
  const LoadSubjectsOfSelectedExamAction();
}
@immutable
class LoadSubjectsOfSelectedExamSuccessAction extends redux.Action{
  final int examId;
  final Iterable<int> ids;
  const LoadSubjectsOfSelectedExamSuccessAction({
    required this.examId,
    required this.ids
  });
}