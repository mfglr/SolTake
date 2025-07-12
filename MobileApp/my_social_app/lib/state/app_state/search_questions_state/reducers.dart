import 'package:my_social_app/state/app_state/search_questions_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,Id<int>> firstSearchQuestionsReducer(Pagination<int,Id<int>> prev, FirstSearchQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int,Id<int>> firstSearchQuestionsSuccessReducer(Pagination<int,Id<int>> prev, FirstSearchQuestionsSuccessAction action)
  => prev.refreshPage(action.ids);
Pagination<int,Id<int>> firstSearchQuestionsFailedReducer(Pagination<int,Id<int>> prev, FirstSearchQuestionsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,Id<int>> nextSearchQuestionsReducer(Pagination<int,Id<int>> prev, NextSearchQuestionsAction action)
  => prev.startLoadingNext();
Pagination<int,Id<int>> nextSearchQuestionsSuccessReducer(Pagination<int,Id<int>> prev, NextSearchQuestionsSuccessAction action)
  => prev.addNextPage(action.ids);
Pagination<int,Id<int>> nextSearchQuestionsFailedReducer(Pagination<int,Id<int>> prev, NextSearchQuestionsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,Id<int>>> searchQuestionsReducer = combineReducers<Pagination<int,Id<int>>>([
  TypedReducer<Pagination<int,Id<int>>,FirstSearchQuestionsAction>(firstSearchQuestionsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,FirstSearchQuestionsSuccessAction>(firstSearchQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,FirstSearchQuestionsFailedAction>(firstSearchQuestionsFailedReducer).call,

  TypedReducer<Pagination<int,Id<int>>,NextSearchQuestionsAction>(nextSearchQuestionsReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextSearchQuestionsSuccessAction>(nextSearchQuestionsSuccessReducer).call,
  TypedReducer<Pagination<int,Id<int>>,NextSearchQuestionsFailedAction>(nextSearchQuestionsFailedReducer).call,
]);
