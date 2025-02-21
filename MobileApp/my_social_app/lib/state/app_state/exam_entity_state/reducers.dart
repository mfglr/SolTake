import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,ExamState> addExamsReducer(EntityState<num,ExamState> prev,AddExamsAction action)
  => prev.appendMany(action.exams);
EntityState<num,ExamState> addExamReducer(EntityState<num,ExamState> prev,AddExamAction action)
  => prev.appendOne(action.exam);

EntityState<num,ExamState> nextQuestionsReducer(EntityState<num,ExamState> prev,NextExamQuestionsAction action)
  => prev.updateOne(prev.getValue(action.examId)!.startLoadingNextQuestions());
EntityState<num,ExamState> nextQuestionsSuccessReducer(EntityState<num,ExamState> prev,NextExamQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.examId)!.addNextQuestions(action.questionIds));
EntityState<num,ExamState> nextQuestionsFailedReducer(EntityState<num,ExamState> prev,NextExamQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.examId)!.stopLoadingNextQuestions());

EntityState<num,ExamState> prevQuestionsReducer(EntityState<num,ExamState> prev,PrevExamQuestionsAction action)
  => prev.updateOne(prev.getValue(action.examId)!.startLoadingPrevQuestions());
EntityState<num,ExamState> prevQuestionsSuccessReducer(EntityState<num,ExamState> prev,PrevExamQuestionsSuccessAction action)
  => prev.updateOne(prev.getValue(action.examId)!.addPrevQuestions(action.questionIds));
EntityState<num,ExamState> prevQuestionsFailedReducer(EntityState<num,ExamState> prev,PrevExamQuestionsFailedAction action)
  => prev.updateOne(prev.getValue(action.examId)!.stopLoadingPrevQuestions());

EntityState<num,ExamState> nextSubjectsReducer(EntityState<num,ExamState> prev,NextExamSubjectsAction action)
  => prev.updateOne(prev.getValue(action.examId)!.startLoadingNextSubjects());
EntityState<num,ExamState> nextSubjectsSuccessReducer(EntityState<num,ExamState> prev,NextExamSubjectsSuccessAction action)
  => prev.updateOne(prev.getValue(action.examId)!.addNextSubjects(action.subjectIds));
EntityState<num,ExamState> nextSubjectsFailedReducer(EntityState<num,ExamState> prev,NextExamSubjectsFailedAction action)
  => prev.updateOne(prev.getValue(action.examId)!.stopLoadingNextSubjects());

Reducer<EntityState<num,ExamState>> examEntityStateReducers = combineReducers<EntityState<num,ExamState>>([
  TypedReducer<EntityState<num,ExamState>,AddExamAction>(addExamReducer).call,
  TypedReducer<EntityState<num,ExamState>,AddExamsAction>(addExamsReducer).call,

  TypedReducer<EntityState<num,ExamState>,NextExamQuestionsAction>(nextQuestionsReducer).call,
  TypedReducer<EntityState<num,ExamState>,NextExamQuestionsSuccessAction>(nextQuestionsSuccessReducer).call,
  TypedReducer<EntityState<num,ExamState>,NextExamQuestionsFailedAction>(nextQuestionsFailedReducer).call,

  TypedReducer<EntityState<num,ExamState>,PrevExamQuestionsAction>(prevQuestionsReducer).call,
  TypedReducer<EntityState<num,ExamState>,PrevExamQuestionsSuccessAction>(prevQuestionsSuccessReducer).call,
  TypedReducer<EntityState<num,ExamState>,PrevExamQuestionsFailedAction>(prevQuestionsFailedReducer).call,
  
  TypedReducer<EntityState<num,ExamState>,NextExamSubjectsAction>(nextSubjectsReducer).call,
  TypedReducer<EntityState<num,ExamState>,NextExamSubjectsSuccessAction>(nextSubjectsSuccessReducer).call,
  TypedReducer<EntityState<num,ExamState>,NextExamSubjectsFailedAction>(nextSubjectsFailedReducer).call,
]);