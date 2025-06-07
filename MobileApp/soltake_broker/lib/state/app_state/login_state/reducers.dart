import 'package:redux/redux.dart';
import 'package:soltake_broker/state/app_state/login_state/actions.dart';
import 'package:soltake_broker/state/app_state/login_state/login_state.dart';

LoginState? loginByPasswordSuccessReducer(LoginState? prev, LoginByPasswordSuccessAction action)
  => action.login;

Reducer<LoginState?> loginReducers = combineReducers<LoginState?>([
  TypedReducer<LoginState?, LoginByPasswordSuccessAction>(loginByPasswordSuccessReducer).call
]);