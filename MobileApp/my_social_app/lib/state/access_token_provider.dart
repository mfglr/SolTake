class AccessTokenProvider{
  AccessTokenProvider._();
  static final AccessTokenProvider _singleton = AccessTokenProvider._();
  factory AccessTokenProvider() => _singleton;
  
  String? _accessToken;
  String? get accessToken => _accessToken;
  void updateAccessToken(String accessToken) => _accessToken = accessToken;
}