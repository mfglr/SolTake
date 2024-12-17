import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/actions.dart';
import 'package:my_social_app/state/app_state/active_account_page_state/active_account_page.dart';

ActiveAccountPage changeActiveAccountPageReducer(ActiveAccountPage prev,AppAction action)
  => action is ChangeActiveAccountPageAction ? action.activeAcountPage : prev;