import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/exam_entity_state/exam_state.dart';

@immutable
class LoadExamsAction extends redux.Action{
  const LoadExamsAction();
}

@immutable
class LoadExamSuccessAction extends redux.Action{
  final Iterable<ExamState> exams;
  const LoadExamSuccessAction({ required this.exams });
}

@immutable
class AddExamSuccessAction extends redux.Action{
  final ExamState exam;
  const AddExamSuccessAction({ required this.exam });
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