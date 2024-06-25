import 'dart:convert';
import 'package:my_social_app/models/login_response.dart';
import 'package:my_social_app/services/http_service.dart';

class LoginService extends HttpService{
  static const String _controller = "login";
  static const String _login = "loginByPassword";
  static const String _loginByRefreshToken = "loginByRefreshToken";

  Future<LoginResponse> login(String emailOrUserName, String password) async {
    final requestBody = jsonEncode(<String, String>{ 'emailOrUserName': emailOrUserName, 'password': password });
    return LoginResponse.fromJson( await super.post("$_controller/$_login",requestBody: requestBody) );
  }

  Future<LoginResponse> loginByReshtoken(String id,String token) async{
    final requestBody = jsonEncode(<String,String>{ 'id': id,'token': token});
    return LoginResponse.fromJson( await super.post("$_controller/$_loginByRefreshToken",requestBody: requestBody) );
  }

}