import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/main.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/state/pagination/page.dart';

class AppClient{
  static final apiUrl = "${dotenv.env['API_URL']}/api";

  const AppClient._();
  static const AppClient _singleton = AppClient._();
  factory AppClient() => _singleton;

  Map<String,String> getHeader() =>
    {
      "Authorization": "Bearer ${store.state.accessToken}",
      "Accept-Language": store.state.accountState?.language ?? PlatformDispatcher.instance.locale.languageCode,
      "Client-Version": packageInfo.version
    };

  Uri generateUri(String url) => Uri.parse("$apiUrl/$url");
  
  Future<StreamedResponse> send(BaseRequest request, {Map<String, String>? headers}) async {
    request.headers.addAll(getHeader());
    if(headers != null) request.headers.addAll(headers);
    
    var response = await request.send();
    if(response.statusCode >= 400){
      throw BackendException(message: utf8.decode(await response.stream.toBytes()),statusCode: response.statusCode);
    }
    return response;
  }

  Future<StreamedResponse> sendJsonContent(Request request) async {
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

  Future<Uint8List> getBytes(String url) =>
    send(Request("GET", generateUri(url))).then((response) => response.stream.toBytes());

  Future<Uint8List> getRangeBytes(String url, int offset, int count) =>
    send(Request("GET",generateUri("$url?offset=$offset&count=$count"))).then((response) => response.stream.toBytes());

  Future<dynamic> post(String url, { Map<String,Object?>? body }) async {
    final Request request = Request("POST", generateUri(url));
    request.body = jsonEncode(body);
    final response = await sendJsonContent(request);
    return jsonDecode(utf8.decode(await response.stream.toBytes()));
  }

  Future<void> put(String url, { Map<String,Object?>? body }) async {
    final Request request = Request("PUT", generateUri(url));
    request.body = jsonEncode(body);
    await sendJsonContent(request);
  }

  Future<void> delete(String url,{ Map<String,Object?>? body }) async {
    final Request request = Request("DELETE", generateUri(url));
    request.body = jsonEncode(body);
    await sendJsonContent(request);
  }

  String generatePaginationUrl(String url, Page page){
    if(page.offset == null){
      return "$url?take=${page.take}&isDescending=${page.isDescending}";
    }
    return "$url?offset=${page.offset}&take=${page.take}&isDescending=${page.isDescending}";
  }
}