import 'package:my_social_app/state/app_state/account_state/account_state.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:redux/redux.dart';

AccountState? updateAccountStateReducer(AccountState? prev,UpdateAccountStateAction action)
  => action.payload;

AccountState? updateLanguageReducer(AccountState? prev,UpdateLanguageSuccessAction action)
  => prev?.updateLanguage(action.language);

AccountState? confirmEmailReducer(AccountState? prev,ConfirmEmailByTokenSuccessAction action)
  => prev?.confirmEmail();

AccountState? approveTermsOfUseReducer(AccountState? prev,ApproveTermsOfUseSuccessAction action)
  => prev?.approveTermsOfUse();
AccountState? approvePrivacyPolicyReducer(AccountState? prev, ApprovePrivacyPolicySuccessAction action)
  => prev?.approvePrivacyPolicy();

AccountState? accountDeleteReducer(AccountState? prev,DeleteAccountAction action)
  => prev?.startAccountDeletion();
AccountState? deleteAccountFailedReducer(AccountState? prev,DeleteAccountFailedAction action)
  => prev?.stopAccountDeletion();

final Reducer<AccountState?> accoutStateReducers = combineReducers<AccountState?>([
  TypedReducer<AccountState?,UpdateAccountStateAction>(updateAccountStateReducer).call,
  TypedReducer<AccountState?,UpdateLanguageSuccessAction>(updateLanguageReducer).call,
  TypedReducer<AccountState?,ConfirmEmailByTokenSuccessAction>(confirmEmailReducer).call,
  TypedReducer<AccountState?,ApprovePrivacyPolicySuccessAction>(approvePrivacyPolicyReducer).call,
  TypedReducer<AccountState?,ApproveTermsOfUseSuccessAction>(approveTermsOfUseReducer).call,
  TypedReducer<AccountState?,DeleteAccountAction>(accountDeleteReducer).call,
  TypedReducer<AccountState?,DeleteAccountFailedAction>(deleteAccountFailedReducer).call,
]);