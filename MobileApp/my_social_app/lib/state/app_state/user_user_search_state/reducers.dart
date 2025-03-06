import 'package:my_social_app/state/app_state/user_user_search_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,UserUserSearchState> addUserUserSearchSuccessReducer(Pagination<int,UserUserSearchState> prev, AddUserUserSearchSuccessAction action)
  => prev.prependOneAndRemovePrev(action.userUserSearch);
Pagination<int,UserUserSearchState> removeUserUserSearchSuccessReducer(Pagination<int,UserUserSearchState> prev, RemoveUserUserSearchSuccessAction action)
  => prev.where((e) => e.searchedId != action.searchedId);

Reducer<Pagination<int,UserUserSearchState>> userUserSearchsReducers = combineReducers<Pagination<int,UserUserSearchState>>([
  TypedReducer<Pagination<int,UserUserSearchState>, AddUserUserSearchSuccessAction>(addUserUserSearchSuccessReducer).call,
  TypedReducer<Pagination<int,UserUserSearchState>, RemoveUserUserSearchSuccessAction>(removeUserUserSearchSuccessReducer).call,
]);