import 'dart:async';
import 'package:soltake_broker/models/login.dart';
import 'package:soltake_broker/services/app_client.dart';

class UserService{
  static const String _controller = "users";
  final AppClient _appClient;
  
  UserService._(this._appClient);
  static final UserService _singleton = UserService._(AppClient());
  factory UserService() => _singleton;
  
  Future<Login> loginByPassword(String emailOrUserName, String password) =>
    _appClient
      .post(
        "$_controller/loginByPassword",
        body: {
          'emailOrUserName':emailOrUserName,
          'password':password
        }
      )
      .then((json) => Login.fromJson(json));
  
  Future<Login> loginByRefreshtoken(num id,String token) =>
    _appClient
      .post(
        "$_controller/loginByRefreshToken",
        body: { 'id': id.toString(),'token': token}
      )
      .then((json) => Login.fromJson(json));

  Future removeRefreshTokens(String token) =>
    _appClient.put("$_controller/removeRefreshTokens", body: { 'token': token });
}