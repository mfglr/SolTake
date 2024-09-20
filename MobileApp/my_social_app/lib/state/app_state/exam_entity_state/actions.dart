import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';

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
class GetNextPageExamQuestionsIfNoPageAction extends AppAction{
  final int examId;
  const GetNextPageExamQuestionsIfNoPageAction({required this.examId});
}
@immutable
class GetNextPageExamQuestionsIfReadyAction extends AppAction{
  final int examId;
  const GetNextPageExamQuestionsIfReadyAction({required this.examId});
}
@immutable
class GetNextPageExamQuestionsAction extends AppAction{
  final int examId;
  const GetNextPageExamQuestionsAction({required this.examId});
}
@immutable
class AddNextPageExamQuestionsAction extends AppAction{
  final int examId;
  final Iterable<int> questionIds;
  const AddNextPageExamQuestionsAction({required this.examId, required this.questionIds});
}

@immutable
class GetPrevPageExamQuestionsIfReadyAction extends AppAction{
  final int examId;
  const GetPrevPageExamQuestionsIfReadyAction({required this.examId});
}
@immutable
class GetPrevPageExamQuestionsAction extends AppAction{
  final int examId;
  const GetPrevPageExamQuestionsAction({required this.examId});
}
@immutable
class AddPrevPageExamQuestionsAction extends AppAction{
  final int examId;
  final Iterable<int> questionIds;
  const AddPrevPageExamQuestionsAction({required this.examId, required this.questionIds});
}

@immutable
class GetNextPageExamSubjectsIfNoPageAction extends AppAction{
  final int examId;
  const GetNextPageExamSubjectsIfNoPageAction({required this.examId});
}
@immutable
class GetNextPageExamSubjectsAction extends AppAction{
  final int examId;
  const GetNextPageExamSubjectsAction({required this.examId});
}
@immutable
class AddNextPageExamSubjectsAction extends AppAction{
  final int examId;
  final Iterable<int> subjectIds;
  const AddNextPageExamSubjectsAction({required this.examId, required this.subjectIds});
}