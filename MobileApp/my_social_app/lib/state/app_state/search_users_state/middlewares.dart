import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/search_users_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';
import 'package:my_social_app/state/entity_state/page.dart' as pagination;


void firstSearchUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is FirstSearchUsersAction){
    UserService()
      .search(action.key, pagination.Page.init(usersPerPage, true))
      .then((e) => store.dispatch(FirstSearchUsersSuccessAction(users: e.map((v) => v.toSearchUserState()))))
      .catchError((e){
        store.dispatch(const FirstSearchUsersFailedAction());
        throw e;
      });
  }
  next(action);
}

void nextSearchUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextSearchUsersAction){
    UserService()
      .search(action.key, store.state.searchUsers.next)
      .then((e) => store.dispatch(NextSearchUsersSuccessAction(users: e.map((v) => v.toSearchUserState()))))
      .catchError((e){
        store.dispatch(const NextSearchUsersFailedAction());
        throw e;
      });
  }
  next(action);
}

void prevSearchUsersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is PrevSearchUsersAction){
    UserService()
      .search(action.key, store.state.searchUsers.prev)
      .then((e) => store.dispatch(PrevSearchUsersSuccessAction(users: e.map((v) => v.toSearchUserState()))))
      .catchError((e){
        store.dispatch(const PrevSearchUsersFailedAction());
        throw e;
      });
  }
  next(action);
}