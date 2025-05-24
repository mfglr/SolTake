import 'package:my_social_app/state/app_state/login_state/actions.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';
import 'package:redux/redux.dart';


LoginState? updateLanguageReducer(LoginState? prev,UpdateLanguageSuccessAction action)
  => prev?.updateLanguage(action.language);
LoginState? confirmEmailReducer(LoginState? prev,ConfirmEmailByTokenSuccessAction action)
  => prev?.confirmEmail();
LoginState? approveTermsOfUseReducer(LoginState? prev,ApproveTermsOfUseSuccessAction action)
  => prev?.approveTermsOfUse();
LoginState? approvePrivacyPolicyReducer(LoginState? prev, ApprovePrivacyPolicySuccessAction action)
  => prev?.approvePrivacyPolicy();

LoginState? updateRefreshToken(LoginState? prev,UpdateRefreshTokenAction action)
  => prev?.updateRefhreshToken(action.refreshToken);

final Reducer<LoginState?> loginReducers = combineReducers<LoginState?>([
  TypedReducer<LoginState?,UpdateLanguageSuccessAction>(updateLanguageReducer).call,
  TypedReducer<LoginState?,ConfirmEmailByTokenSuccessAction>(confirmEmailReducer).call,
  TypedReducer<LoginState?,ApprovePrivacyPolicySuccessAction>(approvePrivacyPolicyReducer).call,
  TypedReducer<LoginState?,ApproveTermsOfUseSuccessAction>(approveTermsOfUseReducer).call,
  TypedReducer<LoginState?,UpdateRefreshTokenAction>(updateRefreshToken).call
]);