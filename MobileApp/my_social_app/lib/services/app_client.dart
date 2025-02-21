import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/services/package_version_service.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/state/entity_state/page.dart';

class AppClient{
  static final apiUrl = "${dotenv.env['API_URL']}/api";
  static final blobService = "$apiUrl/blobs";

  const AppClient._();
  static const AppClient _singleton = AppClient._();
  factory AppClient() => _singleton;

  Future<Map<String,String>> getHeader() async =>
    {
      "Authorization": "Bearer ${store.state.accessToken}",
      "Accept-Language": store.state.loginState?.language ?? PlatformDispatcher.instance.locale.languageCode,
      "Client-Version": await PackageVersionService().getVersion()
    };

  Uri generateUri(String url) => Uri.parse("$apiUrl/$url");
  
  Future<StreamedResponse> send(BaseRequest request, {Map<String, String>? headers}) async {
    request.headers.addAll(await getHeader());
    if(headers != null) request.headers.addAll(headers);
   
    var response = await request.send();

    if(response.statusCode >= 400){
      throw BackendException(
        message: utf8.decode(await response.stream.toBytes()),
        statusCode: response.statusCode
      );
    }
    return response;
  }

  Future<String> postStream(BaseRequest request, void Function(double) callback) async {
    var stream = request.finalize();
    var length = request.contentLength ?? 1;

    var r = await HttpClient().postUrl(request.url);
    r.headers.set(HttpHeaders.contentTypeHeader, request.headers[HttpHeaders.contentTypeHeader]!);
    r.headers.set(HttpHeaders.authorizationHeader, "Bearer ${store.state.accessToken}");
    r.headers.set(HttpHeaders.acceptLanguageHeader, store.state.loginState?.language ?? PlatformDispatcher.instance.locale.languageCode);
    r.headers.set("Client-Version", await PackageVersionService().getVersion());

    var byteCount = 0;

    await r.addStream(
      stream.transform(
        StreamTransformer.fromHandlers(
          handleData: (data,sink){
            sink.add(data);
            byteCount += data.length;
            callback(byteCount / length);
          }
        )  
      )
    );

    var response = await r.close();

    final completer = Completer<String>();
    final contents = StringBuffer();
    response.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    var data = await completer.future;
    
    if(response.statusCode >= 400){
      throw BackendException(message: data,statusCode: response.statusCode);
    }

    return data;
  }

  Future<StreamedResponse> sendJsonContent(Request request) {
    request.headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    return send(request);
  }

  Future<dynamic> get(String url) async {
    final Request request = Request("GET", generateUri(url));
    final response = await 
      send(request);
      
    var decode = utf8.decode(await response.stream.toBytes());
    if(decode == '') return null;
    return jsonDecode(decode);
  }

  Future<Uint8List> getBytes(String url) =>
    send(Request("GET", generateUri(url))).then((response) => response.stream.toBytes());

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