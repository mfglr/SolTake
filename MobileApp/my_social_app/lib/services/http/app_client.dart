import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:my_social_app/constants/account_endpoints.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/providers/access_token_provider.dart';
import 'package:my_social_app/storages/account_secure_storage.dart';
import 'package:my_social_app/storages/base_account_storage.dart';

class AppClient extends http.BaseClient {
  static final _apiUrl = dotenv.env['API_URL'];

  final AccessTokenProvider _tokenManager;
  final BaseAccountStorage _accountStorage;
  final http.Client _client;

  AppClient._(this._tokenManager,this._accountStorage,this._client);

  static final AppClient singleton = AppClient._(
    AccessTokenProvider(),
    AccountSecureStorage(),
    http.Client()
  );

  factory AppClient() => singleton;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if(_tokenManager.accessToken != null){
      request.headers.addAll({ "Authorization" : "Bearer ${_tokenManager.accessToken}" });
    }

    http.StreamedResponse response = await _client.send(request);

    if(response.statusCode >= 400){
      final state = await _accountStorage.get();
      switch(response.statusCode){
        case(401):
          final account = await _login(state!.id, state.refreshToken);
          await _accountStorage.set(account.toAccountState());
          request.headers.addAll({ "Authorization" : "Bearer ${account.token.accessToken}" });
          _tokenManager.updateAccessToken(account.token.accessToken);

          response = await _client.send(request);
          if(response.statusCode >= 400) throw await response.stream.bytesToString();
        case(419):
          await _accountStorage.remove();
          throw await response.stream.bytesToString();
        default:
          throw await response.stream.bytesToString();
      }
    }
    return response;
  }

  Future<Account> _login(String id, String token) async{
    final body = jsonEncode(<String,String>{ 'id': id,'token': token});
    final response = await _client.post(
      Uri.parse("$_apiUrl/$accountController/$loginByRefreshTokenEndPoint"),
      body: body,
      headers: { 'Content-Type': 'application/json; charset=UTF-8' }
    );

    if(response.statusCode >= 400) throw response.body;
    
    return Account.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

}