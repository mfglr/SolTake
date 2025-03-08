import 'package:my_social_app/state/app_state/user_search_state/actions.dart';
import 'package:my_social_app/state/app_state/user_search_state/user_search_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,UserSearchState> addSearchsReducer(EntityState<int,UserSearchState> prev,AddUserSearchsAction action)
  => prev.appendMany(action.searchs);

EntityState<int,UserSearchState> addSearchReducer(EntityState<int,UserSearchState> prev,AddUserSearchAction action)
  => prev.appendOne(action.search);

EntityState<int,UserSearchState> removeSearchReducer(EntityState<int,UserSearchState> prev,RemoveUserSearchAction action)
  => prev.removeOne(action.searchId);

Reducer<EntityState<int,UserSearchState>> userSearchEntityReducers = combineReducers<EntityState<int,UserSearchState>>([
  TypedReducer<EntityState<int,UserSearchState>,AddUserSearchsAction>(addSearchsReducer).call,
  TypedReducer<EntityState<int,UserSearchState>,AddUserSearchAction>(addSearchReducer).call,
  TypedReducer<EntityState<int,UserSearchState>,RemoveUserSearchAction>(removeSearchReducer).call,
]);