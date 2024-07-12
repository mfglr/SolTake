import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:my_social_app/services/access_token_provider.dart';
import 'package:http/http.dart' as http;
import 'package:my_social_app/services/account_storage.dart';

class HttpService{
  static final _apiUrl = dotenv.env['API_URL'];
  
  final AccessTokenProvider _accessTokenProvider;
  final AccountStorage _accountStorage;

  const HttpService._(this._accessTokenProvider,this._accountStorage);
  static final HttpService _singleton = HttpService._(AccessTokenProvider(),AccountStorage());
  factory HttpService() => _singleton;

  Uri _generateUri(String url) => Uri.parse("$_apiUrl/$url");
  Map<String,String> _setAuthenticationToken(){
    final Map<String,String> headers = {};
    if(_accessTokenProvider.accessToken != null){
      headers.addAll({ "Authorization" : "Bearer ${_accessTokenProvider.accessToken}"});
    }
    return headers;
  }
  Future<void> _handleExceptions(Response response) async {
    if(response.statusCode >= 400){
      switch(response.statusCode){
        case(419):
          await _accountStorage.remove();
          throw response.body;
        default:
          throw response.body;
      }
    }
  }

  Future<Map<String,dynamic>> get(String url) async {
    Response response = await http.get(_generateUri(url),headers: _setAuthenticationToken());
    await _handleExceptions(response);
    return jsonDecode(response.body) as Map<String,dynamic>;
  }

  Future<List> getList(String url) async {
    Response response = await http.get(_generateUri(url),headers: _setAuthenticationToken());
    await _handleExceptions(response);
    return jsonDecode(response.body);
  }

  Future<Map<String,dynamic>> post(String url,{Object? body}) async {
    final headers = _setAuthenticationToken();
    headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    final response = await http.post(_generateUri(url),body: body,headers: headers);
    await _handleExceptions(response);
    return jsonDecode(response.body) as Map<String,dynamic>;
  }

  Future<void> put(String url,{Object? body}) async {
    final headers = _setAuthenticationToken();
    headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    final response = await http.put(_generateUri(url),body: body,headers: headers);
    await _handleExceptions(response);
  }
  
  Future<Uint8List> readBytes(String url) async {
    return await http.readBytes(_generateUri(url),headers: _setAuthenticationToken());
  }
}