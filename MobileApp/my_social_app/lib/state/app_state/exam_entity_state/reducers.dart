import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/exam_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,ExamState> addExamsReducer(EntityState<int,ExamState> prev,AddExamsAction action)
  => prev.appendMany(action.exams);
EntityState<int,ExamState> addExamReducer(EntityState<int,ExamState> prev,AddExamAction action)
  => prev.appendOne(action.exam);

EntityState<int,ExamState> nextSubjectsReducer(EntityState<int,ExamState> prev,NextExamSubjectsAction action)
  => prev.updateOne(prev.getValue(action.examId)!.startLoadingNextSubjects());
EntityState<int,ExamState> nextSubjectsSuccessReducer(EntityState<int,ExamState> prev,NextExamSubjectsSuccessAction action)
  => prev.updateOne(prev.getValue(action.examId)!.addNextSubjects(action.subjectIds));
EntityState<int,ExamState> nextSubjectsFailedReducer(EntityState<int,ExamState> prev,NextExamSubjectsFailedAction action)
  => prev.updateOne(prev.getValue(action.examId)!.stopLoadingNextSubjects());

Reducer<EntityState<int,ExamState>> examEntityStateReducers = combineReducers<EntityState<int,ExamState>>([
  TypedReducer<EntityState<int,ExamState>,AddExamAction>(addExamReducer).call,
  TypedReducer<EntityState<int,ExamState>,AddExamsAction>(addExamsReducer).call,
  
  TypedReducer<EntityState<int,ExamState>,NextExamSubjectsAction>(nextSubjectsReducer).call,
  TypedReducer<EntityState<int,ExamState>,NextExamSubjectsSuccessAction>(nextSubjectsSuccessReducer).call,
  TypedReducer<EntityState<int,ExamState>,NextExamSubjectsFailedAction>(nextSubjectsFailedReducer).call,
]);