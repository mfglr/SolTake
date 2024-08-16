import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/actions.dart';

AccountState? updateAccountStateReducer(AccountState? oldState,Action action)
  => action is UpdateAccountStateAction ? action.payload : oldState;