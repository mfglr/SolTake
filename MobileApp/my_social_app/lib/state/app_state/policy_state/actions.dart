import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class LoadPrivacyPolicyAction extends AppAction{
  final String language;
  const LoadPrivacyPolicyAction({required this.language});  
}
@immutable
class LoadPrivacyPolicySuccessAction extends AppAction{
  final String html;
  final String language;
  const LoadPrivacyPolicySuccessAction({required this.html,required this.language});
}

@immutable
class LoadTermsOfUseAction extends AppAction{
  final String language;
  const LoadTermsOfUseAction({required this.language});
}
@immutable
class LoadTermsOfUseSuccessAction extends AppAction{
  final String html;
  final String language;
  const LoadTermsOfUseSuccessAction({required this.html, required this.language});
}