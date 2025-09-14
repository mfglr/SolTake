import 'package:my_social_app/state/login_state/login.dart';
import 'package:my_social_app/state/login_state/actions.dart';
import 'package:redux/redux.dart';

Login loginSuccessReducer(Login prev, LoginSuccessAction action)
  => prev.success(action.payload);
Login notLoginReducer(Login prev, NotLoginAction action)
  => prev.notLogin();
Login loginByPasswordReducer(Login prev, LoginByPasswordAction action)
  => prev.loading();
Login createUserReducer(Login prev, CreateUserAction action)
  => prev.loading();
Login loginByGoogleReducer(Login prev, LoginByGoogleAction action)
  => prev.loading();
Login logOutReducer(Login prev, LogOutAction action)
  => prev.loading();
Login deleteUserReducer(Login prev, DeleteUserAction action)
  => prev.loading();

Login updateLanguageReducer(Login prev,UpdateLanguageSuccessAction action)
  => prev.updateLanguage(action.language);
Login confirmEmailReducer(Login prev,ConfirmEmailByTokenSuccessAction action)
  => prev.confirmEmail();
Login approveTermsOfUseReducer(Login prev,ApproveTermsOfUseSuccessAction action)
  => prev.approveTermsOfUse();
Login approvePrivacyPolicyReducer(Login prev, ApprovePrivacyPolicySuccessAction action)
  => prev.approvePrivacyPolicy();

Login updateRefreshToken(Login prev,UpdateRefreshTokenAction action)
  => prev.updateRefhreshToken(action.refreshToken);

final Reducer<Login> loginReducers = combineReducers<Login>([
  TypedReducer<Login,LoginSuccessAction>(loginSuccessReducer).call,
  TypedReducer<Login,NotLoginAction>(notLoginReducer).call,
  TypedReducer<Login,LoginByPasswordAction>(loginByPasswordReducer).call,
  TypedReducer<Login,CreateUserAction>(createUserReducer).call,
  TypedReducer<Login,LoginByGoogleAction>(loginByGoogleReducer).call,
  TypedReducer<Login,LogOutAction>(logOutReducer).call,
  TypedReducer<Login,DeleteUserAction>(deleteUserReducer).call,

  TypedReducer<Login,UpdateLanguageSuccessAction>(updateLanguageReducer).call,
  TypedReducer<Login,ConfirmEmailByTokenSuccessAction>(confirmEmailReducer).call,
  TypedReducer<Login,ApprovePrivacyPolicySuccessAction>(approvePrivacyPolicyReducer).call,
  TypedReducer<Login,ApproveTermsOfUseSuccessAction>(approveTermsOfUseReducer).call,
  TypedReducer<Login,UpdateRefreshTokenAction>(updateRefreshToken).call
]);