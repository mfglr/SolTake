import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/services/user_service.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/users_state/action.dart';
import 'package:redux/redux.dart';

void loadUserByIdMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadUserByIdAction){
    UserService()
      .getById(action.id)
      .then((user) => store.dispatch(LoadUserByIdSuccessAction(user: user.toUserState())))
      .catchError((e){
        if(e is BackendException){
          if(e.statusCode == 404){
            store.dispatch(UserNotFoundByIdAction(id: action.id));
          }
          else{
            store.dispatch(LoadUserByIdFailedAction(id: action.id));
          }
        }
        throw e;
      });
  }
  next(action);
}
void loadUserByUserNameMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoadUserByUserNameAction){
    UserService()
      .getByUserName(action.userName)
      .then((user) => store.dispatch(LoadUserByUserNameSuccessAction(user: user.toUserState())))
      .catchError((e){
        if(e is BackendException){
          if(e.statusCode == 404){
            store.dispatch(UserNotFoundByUserNameAction(userName: action.userName));
          }
          else{
            store.dispatch(LoadUserByUserNameFailedAction(userName: action.userName));
          }
        }
        throw e;
      });
  }
  next(action);
}