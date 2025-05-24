import 'package:my_social_app/state/app_state/active_login_page_state/actions.dart';
import 'package:my_social_app/state/app_state/active_login_page_state/active_login_page.dart';
import 'package:redux/redux.dart';

ActiveLoginPage changeActiveLoginPageReducer(ActiveLoginPage prev, ChangeActiveLoginPage action)
  => action.loginPage;

Reducer<ActiveLoginPage> activeLoginPageReducers = combineReducers<ActiveLoginPage>([
  TypedReducer<ActiveLoginPage,ChangeActiveLoginPage>(changeActiveLoginPageReducer).call,
]);