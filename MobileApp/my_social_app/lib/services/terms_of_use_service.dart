import 'dart:convert';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/terms_of_use_endpoints.dart';
import 'package:my_social_app/services/app_client.dart';

class TermsOfUseService {
  final AppClient _appClient;

  const TermsOfUseService._(this._appClient);
  static final TermsOfUseService _singleton = TermsOfUseService._(AppClient());
  factory TermsOfUseService() => _singleton;

  Future<String> getLastTermsOfUse(String language) =>
    _appClient
      .getBytes("$termsOfUseController/$getLastTermsOfUseEndpoint?language=$language")
      .then((response) => utf8.decode(response));
}