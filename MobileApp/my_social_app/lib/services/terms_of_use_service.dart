import 'dart:convert';
import 'package:my_social_app/constants/container_names.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/services/app_client.dart';

const _temsOfUse = "terms_of_use_";
class TermsOfUseService {
  final AppClient _appClient;

  const TermsOfUseService._(this._appClient);
  static final TermsOfUseService _singleton = TermsOfUseService._(AppClient());
  factory TermsOfUseService() => _singleton;

  Future<String> getLastTermsOfUse(String language) =>
    _appClient
      .getBytes("$blobController/$tersmOfUses/$_temsOfUse$language")
      .then((response) => utf8.decode(response));
}