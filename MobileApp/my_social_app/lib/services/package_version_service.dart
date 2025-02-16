import 'package:package_info_plus/package_info_plus.dart';

class PackageVersionService {
  final Future<PackageInfo> _packageInfo;

  const PackageVersionService._(this._packageInfo);
  static final PackageVersionService _singleton = PackageVersionService._(PackageInfo.fromPlatform());
  factory PackageVersionService() => _singleton;

  Future<String> getVersion() 
    => _packageInfo
        .then((version) => version.version);
}