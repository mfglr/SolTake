import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:soltake_broker/state/app_state/login_state/login_state.dart';

class LoginStorage {
  static const _key = "login";
  static const _storage = FlutterSecureStorage();

  static Future<LoginState?> get() =>
    _storage
      .read(key: _key)
      .then(
        (value) =>
          value != null
            ? LoginState.fromJson(jsonDecode(value) as Map<String, dynamic>)
            : null
      );

  static Future<void> remove() => _storage.delete(key: _key);

  static Future<void> set(LoginState state) =>
    _storage.write(key: _key, value: jsonEncode(state.toJson()));
}