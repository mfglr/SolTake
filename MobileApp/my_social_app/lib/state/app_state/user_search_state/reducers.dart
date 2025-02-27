import 'package:my_social_app/state/app_state/user_search_state/actions.dart';
import 'package:my_social_app/state/app_state/user_search_state/user_search_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,UserSearchState> addSearchsReducer(EntityState<num,UserSearchState> prev,AddUserSearchsAction action)
  => prev.appendMany(action.searchs);

EntityState<num,UserSearchState> addSearchReducer(EntityState<num,UserSearchState> prev,AddUserSearchAction action)
  => prev.appendOne(action.search);

EntityState<num,UserSearchState> removeSearchReducer(EntityState<num,UserSearchState> prev,RemoveUserSearchAction action)
  => prev.removeOne(action.searchId);

Reducer<EntityState<num,UserSearchState>> userSearchEntityReducers = combineReducers<EntityState<num,UserSearchState>>([
  TypedReducer<EntityState<num,UserSearchState>,AddUserSearchsAction>(addSearchsReducer).call,
  TypedReducer<EntityState<num,UserSearchState>,AddUserSearchAction>(addSearchReducer).call,
  TypedReducer<EntityState<num,UserSearchState>,RemoveUserSearchAction>(removeSearchReducer).call,
]);