import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/services/access_token_provider.dart';
import 'package:http/http.dart' as http;

class HttpService{
  static final _apiUrl = dotenv.env['API_URL'];
  
  final AccessTokenProvider _accessTokenProvider;

  const HttpService._(this._accessTokenProvider);
  static final HttpService _singleton = HttpService._(AccessTokenProvider());
  factory HttpService() => _singleton;
  
  Uri generateUri(String url) => Uri.parse("$_apiUrl/$url");
  Map<String,String> _setAuthenticationToken(){
    final Map<String,String> headers = {};
    if(_accessTokenProvider.accessToken != null){
      headers.addAll({ "Authorization" : "Bearer ${_accessTokenProvider.accessToken}"});
    }
    return headers;
  }
  Future<void> _handleExceptions(Response response) async {
    if(response.statusCode >= 400){
      throw BackendException(message: response.body, statusCode: response.statusCode);
    }
  }

  Future<Map<String,dynamic>> get(String url) async {
    Response response = await http.get(generateUri(url),headers: _setAuthenticationToken());
    await _handleExceptions(response);
    return jsonDecode(response.body) as Map<String,dynamic>;
  }

  Future<List> getList(String url) async {
    Response response = await http.get(generateUri(url),headers: _setAuthenticationToken());
    await _handleExceptions(response);
    return jsonDecode(response.body);
  }

  Future<Map<String,dynamic>> post(String url,{Object? body}) async {
    final headers = _setAuthenticationToken();
    headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    final response = await http.post(generateUri(url),body: body,headers: headers);
    await _handleExceptions(response);
    return jsonDecode(response.body) as Map<String,dynamic>;
  }

  Future<void> put(String url,{Object? body}) async {
    final headers = _setAuthenticationToken();
    headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    final response = await http.put(generateUri(url),body: body,headers: headers);
    await _handleExceptions(response);
  }
  
  Future<Map<String,dynamic>> postFormData(MultipartRequest request) async {
    request.headers.addAll(_setAuthenticationToken());
    final response = await request.send();
    final data = utf8.decode(await response.stream.toBytes());
    if(response.statusCode >= 400){
      throw BackendException(message: data, statusCode: response.statusCode);
    }
    return jsonDecode(data) as Map<String,dynamic>;
  }

  Future<Uint8List> readBytes(String url) async {
    return await http.readBytes(generateUri(url),headers: _setAuthenticationToken());
  }
}