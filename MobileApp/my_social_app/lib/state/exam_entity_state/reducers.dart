import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';
import 'package:redux/redux.dart';

ExamEntityState loadExamsReducer(ExamEntityState prev,Action action)
  => action is LoadExamSuccessAction ? prev.loadExams(action.exams) : prev;

ExamEntityState nextPageOfExamQuestionsSuccessReducer(ExamEntityState prev,Action action)
  => action is NextPageOfExamQuestionsSuccessAction ? prev.nextPageOfQuestions(action.examId, action.questionIds) : prev;

Reducer<ExamEntityState> examEntityStateReducers = combineReducers<ExamEntityState>([
  TypedReducer<ExamEntityState,LoadExamSuccessAction>(loadExamsReducer).call,
  TypedReducer<ExamEntityState,NextPageOfExamQuestionsSuccessAction>(nextPageOfExamQuestionsSuccessReducer).call,
]);