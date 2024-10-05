import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/account_endpoints.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/state/app_state/account_state/actions.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/state/pagination/page.dart';

class AppClient{
  static final _apiUrl = "${dotenv.env['API_URL']}/api";

  const AppClient._();
  static const AppClient _singleton = AppClient._();
  factory AppClient() => _singleton;

  Map<String,String> _getHeader() =>
    {
      "Authorization": "Bearer ${store.state.accessToken}",
      "Accept-Language": store.state.accountState?.language ?? PlatformDispatcher.instance.locale.languageCode
    };

  Uri generateUri(String url) => Uri.parse("$_apiUrl/$url");

  Future<Account> _login() async {
    final account = store.state.accountState!;
    final url = Uri.parse("$_apiUrl/$accountController/$loginByRefreshTokenEndPoint");
    final Request request = Request("POST", url);
    request.headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    request.body = jsonEncode({ 'id': account.id.toString(), 'token': account.refreshToken });

    final response = await request.send();
    
    final data = utf8.decode(await response.stream.toBytes());
    if(response.statusCode >= 400) throw BackendException(message: data,statusCode: response.statusCode);
    return Account.fromJson(jsonDecode(data));
  }

  Future<StreamedResponse> send(BaseRequest request,{Map<String, String>? headers}) async {
    
    request.headers.addAll(_getHeader());
    if(headers != null) request.headers.addAll(headers);

    var response = await request.send();
    if(response.statusCode >= 400){
      switch(response.statusCode){
        case 401:
          final newAccountState = (await _login()).toAccountState();
          store.dispatch(UpdateAccountStateAction(payload: newAccountState));
          response = await request.send();
          if(response.statusCode >= 400){
            throw BackendException(message: utf8.decode(await response.stream.toBytes()),statusCode: response.statusCode);
          }
        default:
          throw BackendException(message: utf8.decode(await response.stream.toBytes()),statusCode: response.statusCode);
      }
    }
    return response;
  }

  Future<StreamedResponse> _sendJsonContent(BaseRequest request) async {
    request.headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    return await send(request);
  }

  Future<dynamic> get(String url) async {
    final Request request = Request("GET", generateUri(url));
    final response = await send(request);
    var decode = utf8.decode(await response.stream.toBytes());
    if(decode == '') return null;
    return jsonDecode(decode);
  }

  Future<Uint8List> getBytes(String url) async {
    final Request request = Request("GET", generateUri(url));
    final response = await send(request);
    return await response.stream.toBytes();
  }

  Future<Uint8List> getRangeBytes(String url, int offset, int count){
    var request = Request("GET",generateUri("$url?offset=$offset&count=$count"));
    return send(request).then((response) => response.stream.toBytes());
  }
  

  Future<dynamic> post(String url, { Map<String,Object?>? body }) async {
    final Request request = Request("POST", generateUri(url));
    request.body = jsonEncode(body);
    final response = await _sendJsonContent(request);
    return jsonDecode(utf8.decode(await response.stream.toBytes()));
  }

  Future<void> put(String url, { Map<String,Object?>? body }) async {
    final Request request = Request("PUT", generateUri(url));
    request.body = jsonEncode(body);
    await _sendJsonContent(request);
  }

  Future<void> delete(String url,{ Map<String,Object?>? body }) async {
    final Request request = Request("DELETE", generateUri(url));
    request.body = jsonEncode(body);
    await _sendJsonContent(request);
  }

  String generatePaginationUrl(String url, Page page){
    if(page.offset == null){
      return "$url?take=${page.take}&isDescending=${page.isDescending}";
    }
    return "$url?offset=${page.offset}&take=${page.take}&isDescending=${page.isDescending}";
  }
  
}