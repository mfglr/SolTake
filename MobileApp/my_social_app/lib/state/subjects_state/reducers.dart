import 'package:my_social_app/state/subjects_state/actions.dart';
import 'package:my_social_app/state/subjects_state/subjects_state.dart';
import 'package:redux/redux.dart';

SubjectsState nextExamSubjectsReducer(SubjectsState prev, NextExamSubjectsAction action) =>
  prev.startLoadingNextExamSubjects(action.examId);
SubjectsState nextExamSubjectsSuccessReducer(SubjectsState prev, NextExamSubjectsSuccessAction action) =>
  prev.addNextPageExamSubjects(action.examId,action.subjects);
SubjectsState nextExamSubjectsFailedReducer(SubjectsState prev, NextExamSubjectsFailedAction action) =>
  prev.stopLoadingNextExamSubjects(action.examId);

SubjectsState refreshExamSubjectsReducer(SubjectsState prev, RefreshExamSubjectsAction action) =>
  prev.startLoadingNextExamSubjects(action.examId);
SubjectsState refreshExamSubjectsSuccessReducer(SubjectsState prev, RefreshExamSubjectsSuccessAction action) =>
  prev.refreshExamSubjects(action.examId,action.subjects);
SubjectsState refreshExamSubjectsFailedReducer(SubjectsState prev, RefreshExamSubjectsFailedAction action) =>
  prev.stopLoadingNextExamSubjects(action.examId);

Reducer<SubjectsState> subjectsReducer = combineReducers<SubjectsState>([
  TypedReducer<SubjectsState, NextExamSubjectsAction>(nextExamSubjectsReducer).call,
  TypedReducer<SubjectsState, NextExamSubjectsSuccessAction>(nextExamSubjectsSuccessReducer).call,
  TypedReducer<SubjectsState, NextExamSubjectsFailedAction>(nextExamSubjectsFailedReducer).call,

  TypedReducer<SubjectsState, RefreshExamSubjectsAction>(refreshExamSubjectsReducer).call,
  TypedReducer<SubjectsState, RefreshExamSubjectsSuccessAction>(refreshExamSubjectsSuccessReducer).call,
  TypedReducer<SubjectsState, RefreshExamSubjectsFailedAction>(refreshExamSubjectsFailedReducer).call,
]);