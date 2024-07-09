import 'dart:convert';
import 'package:my_social_app/constants/storage_keys.dart';
import 'package:my_social_app/providers/states/account_state.dart';
import 'package:my_social_app/storages/base_account_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountStorage implements BaseAccountStorage{
  const AccountStorage._();
  static const AccountStorage singleton = AccountStorage._();
  factory AccountStorage() => singleton;

  @override
  Future<AccountState?> get() async {
    final prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(account_storage_key);
    return value != null ? AccountState.fromJson(jsonDecode(value) as Map<String, dynamic>) : null;
  }

  @override
  Future set(AccountState state) async {
    final prefs = await SharedPreferences.getInstance();
    final String value = jsonEncode(state.toJson());
    await prefs.setString(account_storage_key, value);
  }

  @override
  Future remove() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(account_storage_key);
  }
}