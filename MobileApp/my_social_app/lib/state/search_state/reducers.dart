import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/search_state/search_state.dart';
import 'package:redux/redux.dart';

SearchState searchReducer(SearchState oldState,Action action)
  => action is SuccessfullySearchedAction ? oldState.search(action.key, action.payload) : oldState;

SearchState nextPageSearchingReducer(SearchState oldState,Action action)
  => action is NextPageSearchingSuccessAction ? oldState.nextPage(action.payload) : oldState;

SearchState clearSearchingReducer(SearchState oldState,Action action)
  => action is ClearSearchingAction ? oldState.clear() : oldState;

Reducer<SearchState> searchStateReducers = combineReducers<SearchState>([
  TypedReducer<SearchState,SuccessfullySearchedAction>(searchReducer).call,
  TypedReducer<SearchState,NextPageSearchingSuccessAction>(nextPageSearchingReducer).call,
  TypedReducer<SearchState,ClearSearchingAction>(clearSearchingReducer).call,
]);