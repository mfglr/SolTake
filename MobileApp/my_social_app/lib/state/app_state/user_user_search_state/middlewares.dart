import 'package:my_social_app/services/user_user_search_service.dart';
import 'package:my_social_app/state/app_state/search_users_state/search_user_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/actions.dart';
import 'package:my_social_app/state/app_state/user_user_search_state/user_user_search_state.dart';
import 'package:redux/redux.dart';

void addUserUserSearchMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is AddUserUserSearchAction){
    final SearchUserState user = store.state.searchUsers.getById(action.searchedId)!;
    UserUserSearchService()
      .create(action.searchedId)
      .then((response) => store.dispatch(AddUserUserSearchSuccessAction(
        userUserSearch: UserUserSearchState(
          id: response.id,
          searchedId: action.searchedId,
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

void nextUserUserSearchsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextUserUserSearchsAction){
    UserUserSearchService()
      .get()
      .then((e) => store.dispatch(NextUserUserSearchsSuccessAction(userUserSearchs: e.map((v) => v.toUserUserSearchState()))))
      .catchError((e){
        store.dispatch(const NextUserUserSearchsFailedAction());
        throw e;
      });
  }
  next(action);
}