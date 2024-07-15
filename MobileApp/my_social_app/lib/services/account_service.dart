import 'dart:async';
import 'package:my_social_app/constants/account_endpoints.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/services/app_client.dart';

class AccountService {
  final AppClient _appClient;

  const AccountService._(this._appClient);
  static final AccountService _singleton = AccountService._(AppClient());
  factory AccountService() => _singleton;

  Future<Account> create(String email, String password, String passwordConfirmation) async {
    return Account.fromJson(
      await _appClient.post(
        "$accountController/$createEndPoint",
        body: {
          'email':email,
          'password':password,
          "passwordConfirm":passwordConfirmation
        }
      )
    );
  }

  Future<Account> updateEmailConfirmationToken() async {
    return Account.fromJson(
      await _appClient.post(
        "$accountController/$updateEmailConfirmationTokenEndPoint"
      )
    );
  }

  Future<Account> confirmEmailByToken(String token) async {
    return Account.fromJson(
      await _appClient.post(
        "$accountController/$confirmEmailByTokenEntPoint",
        body: { 'token': token }
      )
    );
  }

  Future<Account> loginByPassword(String emailOrUserName, String password) async {
    return Account.fromJson(
      await _appClient.post(
        "$accountController/$loginByPasswordEndPoint",
        body: {
          'emailOrUserName':emailOrUserName,
          'password':password
        }
      )
    );
  }

  Future<Account> loginByReshtoken(int id,String token) async{
    return Account.fromJson(
      await _appClient.post(
        "$accountController/$loginByRefreshTokenEndPoint",
        body: { 'id': id.toString(),'token': token}
      )
    );
  }

  Future<Account> updateEmail(String email) async {
    return Account.fromJson(
      await _appClient.post(
        "$accountController/$updateEmailEndPoint",
        body: {
          'email': email
        }
      )
    );
  }

  Future<Account> updateUserName(String userName) async {
    return Account.fromJson(
      await _appClient.post(
        "$accountController/$updateUserNameEndPoint",
        body: {
          'userName': userName
        }
      )
    );
  }

  Future<void> logOut() async {
    await _appClient.put("$accountController/$logOutEndPoint");
  }
}