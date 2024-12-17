import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:redux/redux.dart';

LoginState changeActiveLoginPageReducer(LoginState prev,ChangeActiveLoginPageAction action)
  => prev.changeActiveLoginPage(action.activeLoginPage);
LoginState changeLonguageReducer(LoginState prev,ChangeLoginLanguageAction action)
  => prev.changeLanguage(action.laguage);

Reducer<LoginState> loginReducers = combineReducers<LoginState>([
  TypedReducer<LoginState,ChangeActiveLoginPageAction>(changeActiveLoginPageReducer).call,
  TypedReducer<LoginState,ChangeLoginLanguageAction>(changeLonguageReducer).call,
]);