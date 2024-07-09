import 'dart:async';
import 'dart:convert';
import 'package:my_social_app/constants/account_endpoints.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/services/http/http_service.dart';

class AccountService {
  final HttpService _httpService;

  const AccountService._(this._httpService);
  static final AccountService _singleton = AccountService._(HttpService());
  factory AccountService() => _singleton;

  Future<Account> create(String email, String password, String passwordConfirmation) async {
    final body = jsonEncode(<String, String>{'email':email,'password':password,"passwordConfirm":passwordConfirmation});
    return Account.fromJson(await _httpService.post("$accountController/$createEndPoint",body: body));
  }

  Future sendEmailConfirmationByTokenMail() async {
    return await _httpService.put("$accountController/$updateEmailConfirmationTokenEndPoint");
  }

  Future confirmEmailByToken(String token) async {
    final requestBody = jsonEncode(<String,String>{'token': token});
    await _httpService.put("$accountController/$confirmEmailByTokenEntPoint",body: requestBody);
  }

  Future<Account> loginByPassword(String emailOrUserName, String password) async {
    final requestBody = jsonEncode(<String, String>{'emailOrUserName':emailOrUserName,'password':password});
    final response = await _httpService.post("$accountController/$loginByPasswordEndPoint",body: requestBody);
    return Account.fromJson(response);
  }

  Future<Account> loginByReshtoken(int id,String token) async{
    final requestBody = jsonEncode(<String,String>{ 'id': id.toString(),'token': token});
    return Account.fromJson(await _httpService.post("$accountController/$loginByRefreshTokenEndPoint",body: requestBody));
  }

  Future<void> updateEmail(String email) async {
    final body = jsonEncode(<String,String>{'email': email});
    await _httpService.post("$accountController/$updateEmailEndPoint", body: body);
  }

  Future<void> updateUserName(String userName) async {
    final body = jsonEncode(<String,String>{'userName': userName});
    await _httpService.post("$accountController/$updateUserNameEndPoint", body: body);
  }
}