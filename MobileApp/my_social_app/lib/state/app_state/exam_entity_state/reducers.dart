import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_entity_state.dart';
import 'package:redux/redux.dart';

ExamEntityState addExamsReducer(ExamEntityState prev,AddExamsAction action)
  => prev.addExams(action.exams);
ExamEntityState addExamReducer(ExamEntityState prev,AddExamAction action)
  => prev.addExam(action.exam);

ExamEntityState nextQuestionsReducer(ExamEntityState prev,NextExamQuestionsAction action)
  => prev.startLoadingNextQuestions(action.examId);
ExamEntityState nextQuestionsSuccessReducer(ExamEntityState prev,NextExamQuestionsSuccessAction action)
  => prev.addNextQuestions(action.examId, action.questionIds);
ExamEntityState nextQuestionsFailedReducer(ExamEntityState prev,NextExamQuestionsFailedAction action)
  => prev.stopLoadingNextQuestions(action.examId);

ExamEntityState prevQuestionsReducer(ExamEntityState prev,PrevExamQuestionsAction action)
  => prev.startLoadingPrevQuestions(action.examId);
ExamEntityState prevQuestionsSuccessReducer(ExamEntityState prev,PrevExamQuestionsSuccessAction action)
  => prev.addPrevPageQuestions(action.examId, action.questionIds);
ExamEntityState prevQuestionsFailedReducer(ExamEntityState prev,PrevExamQuestionsFailedAction action)
  => prev.stopLoadingPrevQuestions(action.examId);

ExamEntityState nextSubjectsReducer(ExamEntityState prev,NextExamSubjectsAction action)
  => prev.startLoadingNextSubjects(action.examId);
ExamEntityState nextSubjectsSuccessReducer(ExamEntityState prev,NextExamSubjectsSuccessAction action)
  => prev.addNextSubjects(action.examId,action.subjectIds);
ExamEntityState nextSubjectsFailedReducer(ExamEntityState prev,NextExamSubjectsFailedAction action)
  => prev.stopLoadingNextSubjects(action.examId);

Reducer<ExamEntityState> examEntityStateReducers = combineReducers<ExamEntityState>([
  TypedReducer<ExamEntityState,AddExamAction>(addExamReducer).call,
  TypedReducer<ExamEntityState,AddExamsAction>(addExamsReducer).call,

  TypedReducer<ExamEntityState,NextExamQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<ExamEntityState,NextExamQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<ExamEntityState,NextExamQuestionsFailedAction>(nextQuestionsFailedReducer).call,

  TypedReducer<ExamEntityState,PrevExamQuestionsAction>(prevQuestionsReducer).call,
  TypedReducer<ExamEntityState,PrevExamQuestionsSuccessAction>(prevQuestionsSuccessReducer).call,
  TypedReducer<ExamEntityState,PrevExamQuestionsFailedAction>(prevQuestionsFailedReducer).call,
  
  TypedReducer<ExamEntityState,NextExamSubjectsAction>(nextSubjectsReducer).call,
  TypedReducer<ExamEntityState,NextExamSubjectsSuccessAction>(nextSubjectsSuccessReducer).call,
  TypedReducer<ExamEntityState,NextExamSubjectsFailedAction>(nextSubjectsFailedReducer).call,
]);