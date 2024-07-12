import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/search_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:redux/redux.dart';

void searchMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is SearchAction){
    UserService()
      .search(action.key)
      .then((users){
        store.dispatch(UsersSuccessfullyLoadedAction(payload: users.map((e) => UserState.init(e)).toList()));
        store.dispatch(SuccessfullySearchedAction(key: action.key, payload: users.map((e) => e.id).toList()));
      });
  }
  next(action);
}

void nextPageSearchingMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageSearchingAction){
    final key = store.state.searchState.key;
    final lastId = store.state.searchState.users.lastId;
    UserService()
      .search(key,lastId: lastId)
      .then((users){
        store.dispatch(UsersSuccessfullyLoadedAction(payload: users.map((e) => UserState.init(e)).toList()));
        store.dispatch(NextPageSearchingSuccessAction(payload: users.map((e) => e.id).toList()));
      });
  }
  next(action);
}

