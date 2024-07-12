import 'dart:async';
import 'dart:convert';
import 'package:my_social_app/constants/account_endpoints.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/services/http_service.dart';

class AccountService {
  final HttpService _httpService;

  const AccountService._(this._httpService);
  static final AccountService _singleton = AccountService._(HttpService());
  factory AccountService() => _singleton;

  Future<Account> create(String email, String password, String passwordConfirmation) async {
    final body = jsonEncode(<String, String>{'email':email,'password':password,"passwordConfirm":passwordConfirmation});
    final json = await _httpService.post("$accountController/$createEndPoint",body: body);
    return Account.fromJson(json);
  }

  Future<void> sendEmailConfirmationByTokenMail() async {
    await _httpService.put("$accountController/$updateEmailConfirmationTokenEndPoint");
  }

  Future<Account> confirmEmailByToken(String token) async {
    final requestBody = jsonEncode(<String,String>{'token': token});
    final json = await _httpService.post("$accountController/$confirmEmailByTokenEntPoint",body: requestBody);
    return Account.fromJson(json);
  }

  Future<Account> loginByPassword(String emailOrUserName, String password) async {
    final requestBody = jsonEncode(<String, String>{'emailOrUserName':emailOrUserName,'password':password});
    final json = await _httpService.post("$accountController/$loginByPasswordEndPoint",body: requestBody);
    return Account.fromJson(json);
  }

  Future<Account> loginByReshtoken(int id,String token) async{
    final requestBody = jsonEncode(<String,String>{ 'id': id.toString(),'token': token});
    final json = await _httpService.post("$accountController/$loginByRefreshTokenEndPoint",body: requestBody);
    return Account.fromJson(json);
  }

  Future<Account> updateEmail(String email) async {
    final body = jsonEncode(<String,String>{'email': email});
    final json = await _httpService.post("$accountController/$updateEmailEndPoint", body: body);
    return Account.fromJson(json);
  }

  Future<Account> updateUserName(String userName) async {
    final body = jsonEncode(<String,String>{'userName': userName});
    final json = await _httpService.post("$accountController/$updateUserNameEndPoint", body: body);
    return Account.fromJson(json);
  }

  Future<void> logOut() async {
    await _httpService.put("$accountController/$logOutEndPoint");
  }
}