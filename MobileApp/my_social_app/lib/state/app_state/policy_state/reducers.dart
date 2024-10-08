import 'package:my_social_app/state/app_state/policy_state/actions.dart';
import 'package:my_social_app/state/app_state/policy_state/policy_state.dart';
import 'package:redux/redux.dart';

PolicyState loadPrivacyPolicyReducer(PolicyState prev,LoadPrivacyPolicySuccessAction action)
  => prev.addPrivacyPolicy(action.html, action.language);

PolicyState laodTermsOfUseReducer(PolicyState prev,LoadTermsOfUseSuccessAction action)
  => prev.addTermsOfUse(action.html,action.language);

Reducer<PolicyState> policyReducers = combineReducers<PolicyState>([
  TypedReducer<PolicyState,LoadPrivacyPolicySuccessAction>(loadPrivacyPolicyReducer).call,
  TypedReducer<PolicyState,LoadTermsOfUseSuccessAction>(laodTermsOfUseReducer).call,
]);