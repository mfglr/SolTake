import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:redux/redux.dart';

SearchState getFirstPageUserReducer(SearchState prev, GetFirstPageSearchingUsersAction action)
  => prev.getFirstPageUsers(action.key);
SearchState addFirstPageUserReducer(SearchState prev,AddFirstPageSearchingUsersAction action)
  => prev.addFirstPageUsers(action.key, action.userIds);

SearchState addNextPageUsersReducer(SearchState prev,AddNextPageSearchingUsersAction action)
  => prev.addNextPageUsers(action.userIds);

SearchState clearSearchingReducer(SearchState prev,ClearSearchingAction action)
  => prev.clear();

Reducer<SearchState> searchStateReducers = combineReducers<SearchState>([
  TypedReducer<SearchState,GetFirstPageSearchingUsersAction>(getFirstPageUserReducer).call,
  TypedReducer<SearchState,AddFirstPageSearchingUsersAction>(addFirstPageUserReducer).call,
  TypedReducer<SearchState,AddNextPageSearchingUsersAction>(addNextPageUsersReducer).call,
  TypedReducer<SearchState,ClearSearchingAction>(clearSearchingReducer).call,
]);