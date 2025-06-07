import 'package:redux/redux.dart';
import 'package:soltake_broker/services/login_storage.dart';
import 'package:soltake_broker/services/user_service.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/login_state/actions.dart';

void loginByPasswordMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoginByPasswordAction){
    UserService()
      .loginByPassword(action.emailOrUserName, action.password)
      .then((login) => store.dispatch(LoginByPasswordSuccessAction(login: login.toLoginState())));
  }
  next(action);
}

void loginByRefreshTokenMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoginByRefreshTokenAction){
    UserService()
      .loginByRefreshtoken(action.id, action.refreshToken)
      .then((login) => store.dispatch(LoginByRefreshTokenSuccessAction(login: login.toLoginState())));
  }
  next(action);
}

void loginByStorageMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoginByRefreshTokenAction){
    LoginStorage()
      .get()
      .then((login) => store.dispatch(LoginByStorageSuccessAction(login: login)));
  }
  next(action);
}