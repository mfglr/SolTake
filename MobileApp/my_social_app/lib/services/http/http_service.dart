import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:my_social_app/services/http/app_client.dart';

class HttpService{
  final Client _httpClient;
  static final _apiUrl = dotenv.env['API_URL'];
  
  const HttpService._(this._httpClient);
  static final HttpService _singleton = HttpService._(AppClient());
  factory HttpService() => _singleton;

  Future<Map<String,dynamic>> get(String url) async {
    return jsonDecode((await _httpClient.get(_generateUri(url))).body) as Map<String,dynamic>;
  }

  Future<List> getList(String url) async {
    return jsonDecode((await _httpClient.get(_generateUri(url))).body);
  }

  Future<Map<String,dynamic>> post(String url,{Object? body}) async {
    return jsonDecode(
      (
        await _httpClient.post(
          _generateUri(url),
          body: body,
          headers: {'Content-Type': 'application/json; charset=UTF-8'}
        )
      ).body
    ) as Map<String,dynamic>;
  }

  Future<void> put(String url,{Object? body}) async {
    await _httpClient.put(
      _generateUri(url),
      body: body,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );
  }
  
  Future<Uint8List> readBytes(String url) async {
    return await _httpClient.readBytes(_generateUri(url));
  }

  Uri _generateUri(String url){
    return Uri.parse("$_apiUrl/$url");
  }
}