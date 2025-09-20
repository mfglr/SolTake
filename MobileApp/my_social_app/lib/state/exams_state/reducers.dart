import 'package:my_social_app/state/exams_state/exam_state.dart';
import 'package:my_social_app/state/exams_state/actions.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int, ExamState> nextExamsReducer(Pagination<int,ExamState> prev, NextExamsAction action) =>
  prev.startLoadingNext();
Pagination<int,ExamState> nextExamsSuccessReducer(Pagination<int,ExamState> prev, NextExamsSuccessAction action) =>
  prev.addNextPage(action.exams);
Pagination<int,ExamState> nextExamsFailedReducer(Pagination<int,ExamState> prev, NextExamsFailedAction action) =>
  prev.stopLoadingNext();

Pagination<int, ExamState> refreshExamsReducer(Pagination<int,ExamState> prev, RefreshExamsAction action) =>
  prev.startLoadingNext();
Pagination<int,ExamState> refreshExamsSuccessReducer(Pagination<int,ExamState> prev, RefreshExamsSuccessAction action) =>
  prev.refreshPage(action.exams);
Pagination<int,ExamState> refreshExamsFailedReducer(Pagination<int,ExamState> prev, RefreshExamsFailedAction action) =>
  prev.stopLoadingNext();

Reducer<Pagination<int,ExamState>> examsReducer = combineReducers<Pagination<int,ExamState>>([
  TypedReducer<Pagination<int, ExamState>, NextExamsAction>(nextExamsReducer).call,
  TypedReducer<Pagination<int, ExamState>, NextExamsSuccessAction>(nextExamsSuccessReducer).call,
  TypedReducer<Pagination<int, ExamState>, NextExamsFailedAction>(nextExamsFailedReducer).call,

  TypedReducer<Pagination<int, ExamState>, RefreshExamsAction>(refreshExamsReducer).call,
  TypedReducer<Pagination<int, ExamState>, RefreshExamsSuccessAction>(refreshExamsSuccessReducer).call,
  TypedReducer<Pagination<int, ExamState>, RefreshExamsFailedAction>(refreshExamsFailedReducer).call,
]);