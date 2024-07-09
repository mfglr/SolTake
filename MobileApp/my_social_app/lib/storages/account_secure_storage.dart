import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_social_app/constants/storage_keys.dart';
import 'package:my_social_app/providers/states/account_state.dart';
import 'package:my_social_app/storages/base_account_storage.dart';

class AccountSecureStorage implements BaseAccountStorage{
  final storage = const FlutterSecureStorage();

  AccountSecureStorage._();
  static final AccountSecureStorage _singleton = AccountSecureStorage._();
  factory AccountSecureStorage() => _singleton;

  @override
  Future<AccountState?> get() async {
    String? value = await storage.read(key: account_storage_key);
    return value != null ? AccountState.fromJson(jsonDecode(value) as Map<String, dynamic>) : null;
  }

  @override
  Future<void> remove() async {
    await storage.delete(key: account_storage_key);
  }

  @override
  Future<void> set(AccountState state) async {
    final String value = jsonEncode(state.toJson());
    await storage.write(key: account_storage_key, value: value);
  }
}