import 'package:redux/redux.dart';
import 'package:soltake_broker/exceptions/backend_exception.dart';
import 'package:soltake_broker/models/login.dart';
import 'package:soltake_broker/services/app_client.dart';
import 'package:soltake_broker/services/login_storage.dart';
import 'package:soltake_broker/services/user_service.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/login_state/actions.dart';

void _setLogin(Login login){
  AppClient.changeAccessToken(login.accessToken);
  LoginStorage
    .set(login.toState())
    .then((_) => UserService.removeRefreshTokens(login.refreshToken));
}

void loginByPasswordMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoginByPasswordAction){
    UserService
      .loginByPassword(action.emailOrUserName, action.password)
      .then((login){
        _setLogin(login);
        store.dispatch(LoginSuccessAction(login: login.toState()));
      });
  }
  next(action);
}

void loginByRefreshTokenMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LoginByRefreshTokenAction){
    LoginStorage
      .get()
      .then((login){
        if(login != null){
          UserService
            .loginByRefreshtoken(login.id, login.refreshToken)
            .then((newLogin){
              _setLogin(newLogin);
              store.dispatch(LoginSuccessAction(login: newLogin.toState()));
            })
            .catchError((e){
              if(e is BackendException && (e.statusCode == 419 || e.statusCode == 404)){
                LoginStorage.remove();
              }
              throw e;
            });
        }
        else{
          store.dispatch(LoginSuccessAction(login: login));
        }
      });
  }
  next(action);
}
