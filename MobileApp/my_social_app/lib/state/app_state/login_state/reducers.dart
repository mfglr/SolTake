import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:redux/redux.dart';

LoginState? updateAccountStateReducer(LoginState? prev,UpdateLoginStateAction action)
  => action.payload;

LoginState? updateLanguageReducer(LoginState? prev,UpdateLanguageSuccessAction action)
  => prev?.updateLanguage(action.language);

LoginState? confirmEmailReducer(LoginState? prev,ConfirmEmailByTokenSuccessAction action)
  => prev?.confirmEmail();

LoginState? approveTermsOfUseReducer(LoginState? prev,ApproveTermsOfUseSuccessAction action)
  => prev?.approveTermsOfUse();
LoginState? approvePrivacyPolicyReducer(LoginState? prev, ApprovePrivacyPolicySuccessAction action)
  => prev?.approvePrivacyPolicy();

LoginState? deleteUserReducer(LoginState? prev,DeleteUserAction action)
  => prev?.startAccountDeletion();
LoginState? deleteUserFailedReducer(LoginState? prev,DeleteUserFailedAction action)
  => prev?.stopAccountDeletion();

final Reducer<LoginState?> accoutStateReducers = combineReducers<LoginState?>([
  TypedReducer<LoginState?,UpdateLoginStateAction>(updateAccountStateReducer).call,
  TypedReducer<LoginState?,UpdateLanguageSuccessAction>(updateLanguageReducer).call,
  TypedReducer<LoginState?,ConfirmEmailByTokenSuccessAction>(confirmEmailReducer).call,
  TypedReducer<LoginState?,ApprovePrivacyPolicySuccessAction>(approvePrivacyPolicyReducer).call,
  TypedReducer<LoginState?,ApproveTermsOfUseSuccessAction>(approveTermsOfUseReducer).call,
  TypedReducer<LoginState?,DeleteUserAction>(deleteUserReducer).call,
  TypedReducer<LoginState?,DeleteUserFailedAction>(deleteUserFailedReducer).call,
]);