import 'package:my_social_app/state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/exam_entity_state/exam_entity_state.dart';
import 'package:redux/redux.dart';

ExamEntityState getNextPageExamQuestionsReducer(ExamEntityState prev,GetNextPageExamQuestionsAction action)
  => prev.getNextPageQuestions(action.examId);
ExamEntityState addNextPageExamQuestionsReducer(ExamEntityState prev,AddNextPageExamQuestionsAction action)
  => prev.addNextPageQuestions(action.examId, action.questionIds);

ExamEntityState getAllExamsReducer(ExamEntityState prev,GetAllExamsAction action)
  => prev.getAllExams();
ExamEntityState addAllExamsReducer(ExamEntityState prev,AddAllExamsAction action)
  =>prev.addAllExams(action.exams);

ExamEntityState addExamsReducer(ExamEntityState prev,AddExamsAction action)
  => prev.addExams(action.exams);
ExamEntityState loadSubjectsOfSelectedExamSuccessReducer(ExamEntityState prev,GetSubjectsOfSelectedExamSuccessAction action)
  =>prev.loadExamSubjects(action.examId, action.ids);

Reducer<ExamEntityState> examEntityStateReducers = combineReducers<ExamEntityState>([
  TypedReducer<ExamEntityState,GetNextPageExamQuestionsAction>(getNextPageExamQuestionsReducer).call,
  TypedReducer<ExamEntityState,AddNextPageExamQuestionsAction>(addNextPageExamQuestionsReducer).call,

  TypedReducer<ExamEntityState,AddExamsAction>(addExamsReducer).call,
  TypedReducer<ExamEntityState,AddAllExamsAction>(addAllExamsReducer).call,
  
  TypedReducer<ExamEntityState,GetSubjectsOfSelectedExamSuccessAction>(loadSubjectsOfSelectedExamSuccessReducer).call,
]);