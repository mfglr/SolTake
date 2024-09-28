import 'dart:async';
import 'package:my_social_app/constants/account_endpoints.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/views/account/login_page/widgets/google_login_button.dart';

class AccountService {
  final AppClient _appClient;

  const AccountService._(this._appClient);
  static final AccountService _singleton = AccountService._(AppClient());
  factory AccountService() => _singleton;

  Future<Account> create(String email, String password, String passwordConfirmation) =>
    _appClient
      .post(
        "$accountController/$createEndPoint",
        body: {
          'email':email,
          'password':password,
          "passwordConfirm":passwordConfirmation
        }
      )
      .then((json) => Account.fromJson(json));

  Future<void> updateEmailConfirmationToken() =>
    _appClient.put("$accountController/$updateEmailConfirmationTokenEndPoint");

  Future<void> confirmEmailByToken(String token) =>
    _appClient
      .put(
        "$accountController/$confirmEmailByTokenEntPoint",
        body: { 'token': token }
      );

  Future<Account> loginByPassword(String emailOrUserName, String password) =>
    _appClient
      .post(
        "$accountController/$loginByPasswordEndPoint",
        body: { 'emailOrUserName':emailOrUserName, 'password':password }
      )
      .then((json) => Account.fromJson(json));
  
  Future<Account> loginByFaceBook(String accessToken) =>
    _appClient
      .post(
        "$accountController/$loginByFaceBookEndpoint",
        body: { 'accessToken': accessToken}
      )
      .then((json) => Account.fromJson(json));
  
  Future<Account> loginByGoogle(String accessToken) =>
    _appClient
      .post(
        "$accountController/$loginByGoogleEndpoint",
        body: { 'accessToken': accessToken }
      )
      .then((json) => Account.fromJson(json))
      .catchError((e) async {
        await googleSignIn.disconnect();
        throw e;
      });

  Future<Account> loginByReshtoken(int id,String token) =>
    _appClient
      .post(
        "$accountController/$loginByRefreshTokenEndPoint",
        body: { 'id': id.toString(),'token': token}
      )
      .then((json) => Account.fromJson(json));

  Future<Account> updateEmail(String email) =>
    _appClient
      .post(
        "$accountController/$updateEmailEndPoint",
        body: { 'email': email }
      )
      .then((json) => Account.fromJson(json));

  Future<Account> updateUserName(String userName) =>
    _appClient
      .post(
        "$accountController/$updateUserNameEndPoint",
        body: { 'userName': userName}
      )
      .then((account) => Account.fromJson(account));

  Future<void> updateLanguage(String language) =>
    _appClient
      .put(
        "$accountController/$updateLanguageEndpoint",
        body: {'language': language }
      );
  
  Future<void> logOut() =>
    _appClient
      .put("$accountController/$logOutEndPoint");

  Future<void> delete() =>
    _appClient
      .delete("$accountController/$deleteAccountEndpoint");

  Future<bool> isUserNameExist(String userName) =>
    _appClient
      .get("$accountController/$isUserNameExistEndPoint/$userName")
      .then((response) => response as bool);
}