import 'package:my_social_app/state/app_state/user_user_search_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,UserUserSearchState> createUserUserSearchSuccessReducer(Pagination<int,UserUserSearchState> prev, CreateUserUserSearchSuccessAction action)
  => prev.prependOneAndRemoveWhere(action.userUserSearch,(e) => e.userId != action.userUserSearch.userId);
Pagination<int,UserUserSearchState> removeUserUserSearchSuccessReducer(Pagination<int,UserUserSearchState> prev, RemoveUserUserSearchSuccessAction action)
  => prev.where((e) => e.userId != action.searchedId);

Pagination<int,UserUserSearchState> nextUserUserSearchReducer(Pagination<int,UserUserSearchState> prev,NextUserUserSearchsAction action)
  => prev.startLoadingNext();
Pagination<int,UserUserSearchState> nextUserUserSearchSuccessReducer(Pagination<int,UserUserSearchState> prev, NextUserUserSearchsSuccessAction action)
  => prev.addNextPage(action.userUserSearchs);
Pagination<int,UserUserSearchState> nextUserUserSearchFailedReducer(Pagination<int,UserUserSearchState> prev, NextUserUserSearchsFailedAction action)
  => prev.stopLoadingNext();

Reducer<Pagination<int,UserUserSearchState>> userUserSearchsReducers = combineReducers<Pagination<int,UserUserSearchState>>([
  TypedReducer<Pagination<int,UserUserSearchState>, CreateUserUserSearchSuccessAction>(createUserUserSearchSuccessReducer).call,
  TypedReducer<Pagination<int,UserUserSearchState>, RemoveUserUserSearchSuccessAction>(removeUserUserSearchSuccessReducer).call,
  
  TypedReducer<Pagination<int,UserUserSearchState>, NextUserUserSearchsAction>(nextUserUserSearchReducer).call,
  TypedReducer<Pagination<int,UserUserSearchState>, NextUserUserSearchsSuccessAction>(nextUserUserSearchSuccessReducer).call,
  TypedReducer<Pagination<int,UserUserSearchState>, NextUserUserSearchsFailedAction>(nextUserUserSearchFailedReducer).call,
]);