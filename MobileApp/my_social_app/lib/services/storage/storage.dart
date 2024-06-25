import 'dart:convert';
import 'package:my_social_app/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage{
  Future<LoginResponse?> getLoginResponse() async {
    final prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(StorageKeys.loginResponse);
    return value != null ? LoginResponse.fromJson(jsonDecode(value) as Map<String, dynamic>) : null;
  }
  
  Future setLoginResponse(LoginResponse data) async {
    final prefs = await SharedPreferences.getInstance();
    final String value = jsonEncode(data.toJson());
    prefs.setString(StorageKeys.loginResponse, value);
  }

  Future removeLoginResponse() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKeys.loginResponse);
  }
}

class StorageKeys{
  static const String loginResponse = "login_response";
}