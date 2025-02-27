import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';

@immutable
class LoadExamAction extends AppAction{
  final num examId;
  const LoadExamAction({required this.examId});
}

@immutable
class AddExamAction extends AppAction{
  final ExamState exam;
  const AddExamAction({required this.exam});
}
@immutable
class AddExamsAction extends AppAction{
  final Iterable<ExamState> exams;
  const AddExamsAction({ required this.exams });
}

@immutable
class NextExamQuestionsAction extends AppAction{
  final num examId;
  const NextExamQuestionsAction({required this.examId});
}
@immutable
class NextExamQuestionsSuccessAction extends AppAction{
  final num examId;
  final Iterable<num> questionIds;
  const NextExamQuestionsSuccessAction({required this.examId, required this.questionIds});
}
@immutable
class NextExamQuestionsFailedAction extends AppAction{
  final num examId;
  const NextExamQuestionsFailedAction({required this.examId});
}

@immutable
class PrevExamQuestionsAction extends AppAction{
  final num examId;
  const PrevExamQuestionsAction({required this.examId});
}
@immutable
class PrevExamQuestionsSuccessAction extends AppAction{
  final num examId;
  final Iterable<num> questionIds;
  const PrevExamQuestionsSuccessAction({required this.examId, required this.questionIds});
}
@immutable
class PrevExamQuestionsFailedAction extends AppAction{
  final num examId;
  const PrevExamQuestionsFailedAction({required this.examId});
}

@immutable
class NextExamSubjectsAction extends AppAction{
  final num examId;
  const NextExamSubjectsAction({required this.examId});
}
@immutable
class NextExamSubjectsSuccessAction extends AppAction{
  final num examId;
  final Iterable<num> subjectIds;
  const NextExamSubjectsSuccessAction({required this.examId, required this.subjectIds});
}
@immutable
class NextExamSubjectsFailedAction extends AppAction{
  final num examId;
  const NextExamSubjectsFailedAction({required this.examId});
}