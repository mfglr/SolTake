import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soltake_broker/state/app_state/login_state/login_state.dart';

class LoginStorage {
  final _key = "login";
  final storage = const FlutterSecureStorage();

  LoginStorage._();
  static final LoginStorage _singleton = LoginStorage._();
  factory LoginStorage() => _singleton;

  Future<LoginState?> get() =>
    storage
      .read(key: _key)
      .then((value) => value != null ? LoginState.fromJson(jsonDecode(value) as Map<String, dynamic>) : null);

  Future<void> remove() =>
    storage.delete(key: _key);

  Future<void> set(LoginState state) =>
    storage.write(key: _key, value: jsonEncode(state.toJson()));
}