import 'package:my_social_app/state/app_state/user_search_state/actions.dart';
import 'package:my_social_app/state/app_state/user_search_state/user_search_entity_state.dart';
import 'package:redux/redux.dart';

UserSearchEntityState addSearchsReducer(UserSearchEntityState prev,AddUserSearchsAction action)
  => prev.addSearchs(action.searchs);

UserSearchEntityState addSearchReducer(UserSearchEntityState prev,AddUserSearchAction action)
  => prev.addSearch(action.search);

UserSearchEntityState removeSearchReducer(UserSearchEntityState prev,RemoveUserSearchAction action)
  => prev.removeSearch(action.searchId);

Reducer<UserSearchEntityState> userSearchEntityReducers = combineReducers<UserSearchEntityState>([
  TypedReducer<UserSearchEntityState,AddUserSearchsAction>(addSearchsReducer).call,
  TypedReducer<UserSearchEntityState,AddUserSearchAction>(addSearchReducer).call,
  TypedReducer<UserSearchEntityState,RemoveUserSearchAction>(removeSearchReducer).call,
]);