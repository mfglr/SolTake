import 'dart:async';
import 'dart:convert';
import 'package:my_social_app/models/login_response.dart';
import 'package:my_social_app/services/http_service.dart';

class AccountService extends HttpService {
  static const String _controller = "accounts";
  static const String _signUp = "create";
  static const String _updateEmailConfirmationToken = "UpdateEmailConfirmationToken";
  static const String _confirmEmailByToken = "ConfirmEmailByToken";

  Future<LoginResponse> signUp(String email, String password, String passwordConfirmation) async {
    final requestBody =  jsonEncode(<String, String>{
      'email': email,
      'password': password,
      "passwordConfirm": passwordConfirmation
    });
    return LoginResponse.fromJson( await super.post("$_controller/$_signUp",requestBody: requestBody) );
  }

  Future sendEmailConfirmationByTokenMail() async {
    return await super.put("$_controller/$_updateEmailConfirmationToken");
  }

  Future confirmEmailByToken(String token) async {
    final requestBody = jsonEncode(<String,String>{
      'token': token
    });
    await super.put("$_controller/$_confirmEmailByToken",requestBody: requestBody);
  }

}