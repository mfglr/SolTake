import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/login_state/actions.dart';
import 'package:soltake_broker/state/app_state/login_state/login_container.dart';

LoginContainer loginByPasswordReducer(LoginContainer prev, LoginByPasswordAction action)
  => prev.loading();
LoginContainer loginByRefreshTokenReducer(LoginContainer prev, LoginByRefreshTokenAction action)
  => prev.loading();
LoginContainer loginSuccessReducer(LoginContainer prev, LoginSuccessAction action)
  => prev.updateLogin(action.login);

Reducer<LoginContainer> loginReducers = combineReducers<LoginContainer>([
  TypedReducer<LoginContainer, LoginByPasswordAction>(loginByPasswordReducer).call,
  TypedReducer<LoginContainer, LoginByRefreshTokenAction>(loginByRefreshTokenReducer).call,
  TypedReducer<LoginContainer, LoginSuccessAction>(loginSuccessReducer).call,
]);