import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';
import 'package:redux/redux.dart';

ExamEntityState loadAllExamsReducer(ExamEntityState prev,Action action)
  => action is LoadAllExamsSuccessAction ? prev.addAllExams(action.exams) : prev;

ExamEntityState addExamsReducer(ExamEntityState prev,Action action)
  => action is AddExamsAction ? prev.addExams(action.exams) : prev;

ExamEntityState nextPageOfExamQuestionsSuccessReducer(ExamEntityState prev,Action action)
  => action is NextPageOfExamQuestionsSuccessAction ? prev.nextPageOfQuestions(action.examId, action.questionIds) : prev;

ExamEntityState loadSubjectsOfSelectedExamSuccessReducer(ExamEntityState prev,Action action)
  => action is LoadSubjectsOfSelectedExamSuccessAction ? prev.loadExamSubjects(action.examId, action.ids) : prev;

Reducer<ExamEntityState> examEntityStateReducers = combineReducers<ExamEntityState>([
  TypedReducer<ExamEntityState,AddExamsAction>(addExamsReducer).call,
  TypedReducer<ExamEntityState,LoadAllExamsSuccessAction>(loadAllExamsReducer).call,
  TypedReducer<ExamEntityState,NextPageOfExamQuestionsSuccessAction>(nextPageOfExamQuestionsSuccessReducer).call,
  TypedReducer<ExamEntityState,LoadSubjectsOfSelectedExamSuccessAction>(loadSubjectsOfSelectedExamSuccessReducer).call,
]);