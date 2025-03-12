import 'package:my_social_app/services/user_user_search_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:redux/redux.dart';

void createUserUserSearchMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is CreateUserUserSearchAction){
    final dynamic user = 
      store.state.searchUsers.getById(action.searchedId) ??
      store.state.userUserSearchs.get((e) => e.userId == action.searchedId);
    UserUserSearchService()
      .create(action.searchedId)
      .then((response) => store.dispatch(CreateUserUserSearchSuccessAction(
        userUserSearch: UserUserSearchState(
          id: response.id,
          userId: action.searchedId,
          userName: user.userName,
          name: user.name,
          image: user.image
        )
      )));
  }
  next(action);
}

void removeUserUserSearchMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RemoveUserUserSearchAction){
    UserUserSearchService()
      .delete(action.searchedId)
      .then((_) => store.dispatch(RemoveUserUserSearchSuccessAction(searchedId: action.searchedId)));
  }
  next(action);
}

void nextUserUserSearchsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextUserUserSearchsAction){
    UserUserSearchService()
      .get(store.state.userUserSearchs.next)
      .then((e) => store.dispatch(NextUserUserSearchsSuccessAction(userUserSearchs: e.map((v) => v.toUserUserSearchState()))))
      .catchError((e){
        store.dispatch(const NextUserUserSearchsFailedAction());
        throw e;
      });
  }
  next(action);
}