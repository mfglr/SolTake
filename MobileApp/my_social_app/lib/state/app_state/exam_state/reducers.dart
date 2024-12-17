import 'package:my_social_app/state/app_state/exam_state/actions.dart';
import 'package:my_social_app/state/pagination/pagination.dart';
import 'package:redux/redux.dart';

Pagination nextExamsReducer(Pagination prev,NextExamsAction action)
  => prev.startLoadingNext();
Pagination nextExamsSuccessReducer(Pagination prev,NextExamsSuccessAction action)
  => prev.addNextPage(action.examIds);
Pagination nextExamsFailedReducer(Pagination prev,NextExamsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination> examsReducers = combineReducers<Pagination>([
  TypedReducer<Pagination,NextExamsAction>(nextExamsReducer).call,
  TypedReducer<Pagination,NextExamsSuccessAction>(nextExamsSuccessReducer).call,
  TypedReducer<Pagination,NextExamsFailedAction>(nextExamsFailedReducer).call,
]);