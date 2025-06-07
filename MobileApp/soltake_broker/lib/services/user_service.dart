import 'dart:async';
import 'package:soltake_broker/models/login.dart';
import 'package:soltake_broker/services/app_client.dart';

class UserService{
  static const String _controller = "users";
  
  static Future<Login> loginByPassword(String emailOrUserName, String password) =>
    AppClient
      .post(
        "$_controller/loginByPassword",
        body: {
          'emailOrUserName':emailOrUserName,
          'password':password
        }
      )
      .then((json) => Login.fromJson(json));
  
  static Future<Login> loginByRefreshtoken(num id,String token) =>
    AppClient
      .post(
        "$_controller/loginByRefreshtoken",
        body: { 'id': id.toString(),'token': token}
      )
      .then((json) => Login.fromJson(json));

  static Future removeRefreshTokens(String token) =>
    AppClient.put("$_controller/removeRefreshTokens", body: { 'token': token });
}