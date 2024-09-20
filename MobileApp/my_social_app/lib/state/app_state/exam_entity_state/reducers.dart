import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_entity_state.dart';
import 'package:redux/redux.dart';

ExamEntityState addExamsReducer(ExamEntityState prev,AddExamsAction action)
  => prev.addExams(action.exams);
ExamEntityState addExamReducer(ExamEntityState prev,AddExamAction action)
  => prev.addExam(action.exam);

ExamEntityState getNextPageQuestionsReducer(ExamEntityState prev,GetNextPageExamQuestionsAction action)
  => prev.getNextPageQuestions(action.examId);
ExamEntityState addNextPageQuestionsReducer(ExamEntityState prev,AddNextPageExamQuestionsAction action)
  => prev.addNextPageQuestions(action.examId, action.questionIds);

ExamEntityState getPrevPageQuestionsReducer(ExamEntityState prev,GetPrevPageExamQuestionsAction action)
  => prev.getPrevPageQuestions(action.examId);
ExamEntityState addPrevPageQuestionsReducer(ExamEntityState prev,AddPrevPageExamQuestionsAction action)
  => prev.addPrevPageQuestions(action.examId, action.questionIds);

ExamEntityState getNextPageSubjectsReducer(ExamEntityState prev,GetNextPageExamSubjectsAction action)
  => prev.getNextPageSubjects(action.examId);
ExamEntityState addNextPageSubjectsReducer(ExamEntityState prev,AddNextPageExamSubjectsAction action)
  => prev.addNextPageSubjects(action.examId,action.subjectIds);

Reducer<ExamEntityState> examEntityStateReducers = combineReducers<ExamEntityState>([
  TypedReducer<ExamEntityState,GetNextPageExamQuestionsAction>(getNextPageQuestionsReducer).call,
  TypedReducer<ExamEntityState,AddNextPageExamQuestionsAction>(addNextPageQuestionsReducer).call,

  TypedReducer<ExamEntityState,GetPrevPageExamQuestionsAction>(getPrevPageQuestionsReducer).call,
  TypedReducer<ExamEntityState,AddPrevPageExamQuestionsAction>(addPrevPageQuestionsReducer).call,

  TypedReducer<ExamEntityState,AddExamAction>(addExamReducer).call,
  TypedReducer<ExamEntityState,AddExamsAction>(addExamsReducer).call,
  
  TypedReducer<ExamEntityState,GetNextPageExamSubjectsAction>(getNextPageSubjectsReducer).call,
  TypedReducer<ExamEntityState,AddNextPageExamSubjectsAction>(addNextPageSubjectsReducer).call,
]);