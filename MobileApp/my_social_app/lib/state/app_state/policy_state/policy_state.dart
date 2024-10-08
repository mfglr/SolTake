import 'package:flutter/material.dart';

@immutable
class PolicyState {
  final Map<String,String> privacyPolicies;
  final Map<String,String> termOfUses;
  const PolicyState({
    required this.privacyPolicies,
    required this.termOfUses
  });

  PolicyState addPrivacyPolicy(String html,String language){
    final Map<String,String> newPrivacyPolicies = {};
    newPrivacyPolicies.addAll(privacyPolicies);
    newPrivacyPolicies[language] = html;
    return PolicyState(privacyPolicies: newPrivacyPolicies, termOfUses: termOfUses);
  }

  PolicyState addTermsOfUse(String html,String language){
    final Map<String,String> newTermsOfUses = {};
    newTermsOfUses.addAll(termOfUses);
    newTermsOfUses[language] = html;
    return PolicyState(privacyPolicies: privacyPolicies, termOfUses: newTermsOfUses);
  }
}