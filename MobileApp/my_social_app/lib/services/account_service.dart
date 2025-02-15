import 'dart:async';
import 'package:my_social_app/constants/account_endpoints.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/constants/request_timeout.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/utilities/toast_creator.dart';
import 'package:my_social_app/views/account/widgets/google_login_button.dart';

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

  Future<void> updateEmailVerificationToken() =>
    _appClient.put("$accountController/$updateEmailVerificationTokenEndPoint");

  Future<void> verifyEmail(String token) =>
    _appClient
      .put(
        "$accountController/$verifyEmailEntPoint",
        body: { 'token': token }
      );

  Future<Account> loginByPassword(String emailOrUserName, String password) =>
    _appClient
      .post(
        "$accountController/$loginByPasswordEndPoint",
        body: { 'emailOrUserName':emailOrUserName, 'password':password }
      )
      .then((json) => Account.fromJson(json));

  Future resetPassword(String email, String token, String password, String passwordConfirm) =>
    _appClient
      .put(
        "$accountController/$resetPasswordEndpoint",
        body: { 'email': email, 'token': token, 'password': password, 'passwordConfirm': passwordConfirm }
      );
  
  Future generateResetPasswordToken(String email) =>
    _appClient
      .put(
        "$accountController/$generateResetPasswordTokenEndpoint",
        body: { 'email':email, }
      );

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

  Future<Account> loginByRefreshtoken(int id,String token) =>
    _appClient
      .post(
        "$accountController/$loginByRefreshTokenEndPoint",
        body: { 'id': id.toString(),'token': token}
      )
      .then((json) => Account.fromJson(json))
      .timeout(
        requestTimeout,
        onTimeout: (){
          ToastCreator.displayError("Service is not available");
          return loginByRefreshtoken(id, token);
        }
      );

  Future<Account> updateEmail(String email) =>
    _appClient
      .post(
        "$accountController/$updateEmailEndPoint",
        body: { 'email': email }
      )
      .then((json) => Account.fromJson(json));

  Future<void> updateUserName(String userName) =>
    _appClient
      .put(
        "$accountController/$updateUserNameEndPoint",
        body: { 'userName': userName }
      );

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

  Future<void> approvePolicy() =>
    _appClient
      .put("$accountController/$approvePrivacyPolicyEndpoint");

  Future<void> approveTermsOfUse() =>
    _appClient
      .put("$accountController/$approveTermsOfUseEndpoint");
}