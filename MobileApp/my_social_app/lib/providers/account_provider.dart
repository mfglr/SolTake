import 'dart:async';
import 'package:my_social_app/models/states/account_state.dart';
import 'package:my_social_app/services/account_service.dart';
import 'package:my_social_app/providers/access_token_provider.dart';
import 'package:my_social_app/storages/account_secure_storage.dart';
import 'package:my_social_app/storages/base_account_storage.dart';

class AccountProvider{
  final AccountService _service;
  final BaseAccountStorage _storage;
  final AccessTokenProvider _accessTokenManager;

  AccountProvider._(this._service,this._storage,this._accessTokenManager);
  static final AccountProvider _singleton = AccountProvider._(
    AccountService(),
    AccountSecureStorage(),
    AccessTokenProvider()
  );
  factory AccountProvider() => _singleton;
  
  AccountState? _state;
  AccountState? get state => _state;

  Future<void> init() async {
    AccountState? state;
    state = await _storage.get();
    if(state != null){
      final account = await _service.loginByReshtoken(state.id, state.refreshToken);
      _state = account.toAccountState();
      _accessTokenManager.updateAccessToken(account.token.accessToken);
      await _storage.set(_state!);
    }
  }

  Future<AccountState?> create(String email, String password,String passwordConfirmation) async {
    final account = await _service.create(email, password, passwordConfirmation);
    _state = account.toAccountState();
    _accessTokenManager.updateAccessToken(account.token.accessToken);
    await _storage.set(_state!);
    return _state;
  }

  Future<AccountState?> loginByPassword(String email, String password) async {
    final account = await _service.loginByPassword(email, password);
    _state = account.toAccountState();
    _accessTokenManager.updateAccessToken(account.token.accessToken);
    await _storage.set(_state!);
    return _state;
  }

  Future<AccountState?> confirmEmailByToken(String token) async {
    await _service.confirmEmailByToken(token);
    _state?.confirmEmail();
    await _storage.set(_state!);
    return _state;
  }

  Future sendEmailConfirmationByTokenMail() async {
    await _service.sendEmailConfirmationByTokenMail();
  }

  Future logOut() async {
    await _storage.remove();
    _state = null;
  }

}