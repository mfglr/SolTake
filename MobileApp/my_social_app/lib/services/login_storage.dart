import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_social_app/constants/storage_keys.dart';
import 'package:my_social_app/state/app_state/login_state/login_state.dart';

class LoginStorage {
  final storage = const FlutterSecureStorage();

  LoginStorage._();
  static final LoginStorage _singleton = LoginStorage._();
  factory LoginStorage() => _singleton;

  Future<LoginState?> get() =>
    storage
      .read(key: accountStorageKey)
      .then((value) => value != null ? LoginState.fromJson(jsonDecode(value) as Map<String, dynamic>) : null);

  Future<void> remove() =>
    storage.delete(key: accountStorageKey);

  Future<void> set(LoginState state) =>
    storage.write(key: accountStorageKey, value: jsonEncode(state.toJson()));
}