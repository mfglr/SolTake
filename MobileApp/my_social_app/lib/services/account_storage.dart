import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_social_app/constants/storage_keys.dart';
import 'package:my_social_app/state/app_state/account_state/account_state.dart';

class AccountStorage {
  final storage = const FlutterSecureStorage();

  AccountStorage._();
  static final AccountStorage _singleton = AccountStorage._();
  factory AccountStorage() => _singleton;

  Future<AccountState?> get() async {
    String? value = await storage.read(key: account_storage_key);
    return value != null ? AccountState.fromJson(jsonDecode(value) as Map<String, dynamic>) : null;
  }

  Future<void> remove() async {
    await storage.delete(key: account_storage_key);
  }

  Future<void> set(AccountState state) async {
    final String value = jsonEncode(state.toJson());
    await storage.write(key: account_storage_key, value: value);
  }
}