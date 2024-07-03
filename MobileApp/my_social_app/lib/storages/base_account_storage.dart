import 'package:my_social_app/models/states/account_state.dart';

abstract class BaseAccountStorage{
  Future<AccountState?> get();
  Future<void> set(AccountState state);
  Future<void> remove();
}