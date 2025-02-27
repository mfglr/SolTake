import 'package:my_social_app/state/app_state/app_exams_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<num,Id<num>> nextExamsReducer(Pagination<num,Id<num>> prev,NextExamsAction action)
  => prev.startLoadingNext();
Pagination<num,Id<num>> nextExamsSuccessReducer(Pagination<num,Id<num>> prev,NextExamsSuccessAction action)
  => prev.addNextPage(action.examIds.map((examId) => Id(id: examId)));
Pagination<num,Id<num>> nextExamsFailedReducer(Pagination<num,Id<num>> prev,NextExamsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<num,Id<num>>> appExamsReducers = combineReducers<Pagination<num,Id<num>>>([
  TypedReducer<Pagination<num,Id<num>>,NextExamsAction>(nextExamsReducer).call,
  TypedReducer<Pagination<num,Id<num>>,NextExamsSuccessAction>(nextExamsSuccessReducer).call,
  TypedReducer<Pagination<num,Id<num>>,NextExamsFailedAction>(nextExamsFailedReducer).call,
]);