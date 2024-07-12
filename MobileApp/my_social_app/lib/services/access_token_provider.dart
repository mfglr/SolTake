class AccessTokenProvider{
  AccessTokenProvider._();
  static final AccessTokenProvider _singleton = AccessTokenProvider._();
  factory AccessTokenProvider() => _singleton;
  
  String? accessToken;
}