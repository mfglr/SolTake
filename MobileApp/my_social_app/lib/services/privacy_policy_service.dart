import 'dart:convert';
import 'package:my_social_app/constants/container_names.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/services/app_client.dart';

const String _blobName = "privacy_policy_";

class PrivacyPolicyService{
  final AppClient _appClient;

  const PrivacyPolicyService._(this._appClient);
  static final PrivacyPolicyService _singleton = PrivacyPolicyService._(AppClient());
  factory PrivacyPolicyService() => _singleton;

  Future<String> getLastPrivacyPolicy(String language) =>
    _appClient
      .getBytes("$blobController/$privacyPolicies/$_blobName$language")
      .then((response) => utf8.decode(response));
}