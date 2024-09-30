import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_social_app/constants/storage_keys.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';

class AccountStorage {
  final storage = const FlutterSecureStorage();

  AccountStorage._();
  static final AccountStorage _singleton = AccountStorage._();
  factory AccountStorage() => _singleton;

  Future<AccountState?> get() =>
    storage
      .read(key: accountStorageKey)
      .then((value) => value != null ? AccountState.fromJson(jsonDecode(value) as Map<String, dynamic>) : null);

  Future<void> remove() =>
    storage.delete(key: accountStorageKey);

  Future<void> set(AccountState state) =>
    storage.write(key: accountStorageKey, value: jsonEncode(state.toJson()));
}