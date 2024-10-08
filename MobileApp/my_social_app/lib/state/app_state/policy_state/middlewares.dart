import 'package:my_social_app/services/privacy_policy_service.dart';
import 'package:my_social_app/services/terms_of_use_service.dart';
import 'package:my_social_app/state/app_state/policy_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void loadPrivacyPolicyMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadPrivacyPolicyAction){
    PrivacyPolicyService()
      .getLastPrivacyPolicy(action.language)
      .then((html) => store.dispatch(LoadPrivacyPolicySuccessAction(html: html, language: action.language)));
  }
  next(action);
}

void loadTermsOfUseMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadTermsOfUseAction){
    TermsOfUseService()
      .getLastTermsOfUse(action.language)
      .then((html) => store.dispatch(LoadTermsOfUseSuccessAction(html: html, language: action.language)));
  }
  next(action);
}