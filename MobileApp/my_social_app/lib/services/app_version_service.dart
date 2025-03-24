import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/version_endpoints.dart';
import 'package:my_social_app/models/version.dart';
import 'package:my_social_app/services/app_client.dart';

class AppVersionService{
  final AppClient _appClient;
  
  AppVersionService._(this._appClient);
  static final AppVersionService _singleton = AppVersionService._(AppClient());
  factory AppVersionService() => _singleton;

  Future<Version> getLatestVersion() =>
    _appClient
      .get("$versionController/$getLatestVersionEndpoint")
      .then((json) => Version.fromJson(json));

  Future<bool> isUpgradeRequired(String code) =>
    _appClient
      .get("$versionController/$isUpgradeRequiredEndpoint/$code")
      .then((response) => response as bool);
}