import 'package:my_social_app/state/app_state/app_exams_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,Id<int>> nextExamsReducer(Pagination<int,Id<int>> prev,NextExamsAction action)
  => prev.startLoadingNext();
Pagination<int,Id<int>> nextExamsSuccessReducer(Pagination<int,Id<int>> prev,NextExamsSuccessAction action)
  => prev.addNextPage(action.examIds.map((examId) => Id(id: examId)));
Pagination<int,Id<int>> nextExamsFailedReducer(Pagination<int,Id<int>> prev,NextExamsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,Id<int>>> appExamsReducers = combineReducers<Pagination<int,Id<int>>>([
  TypedReducer<Pagination<int,Id<int>>,NextExamsAction>(nextExamsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextExamsSuccessAction>(nextExamsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextExamsFailedAction>(nextExamsFailedReducer).call,
]);