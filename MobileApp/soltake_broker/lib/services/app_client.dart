import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:soltake_broker/exceptions/backend_exception.dart';
import 'package:soltake_broker/state/entity_state/page.dart';

class AppClient{
  static final apiUrl = "${dotenv.env['API_URL']}/api";
  static final blobService = "$apiUrl/blobs";

  static String? _accessToken;

  static void changeAccessToken(String? accessToken) => _accessToken = accessToken;

  static Map<String,String> getHeader() => { "Authorization": "Bearer $_accessToken" };

  static Uri generateUri(String url) => Uri.parse("$apiUrl/$url");
  
  static Future<StreamedResponse> send(BaseRequest request, {Map<String, String>? headers}) async {
    request.headers.addAll(getHeader());
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

  static Future<String> postStream(BaseRequest request, void Function(double) callback) async {
    var stream = request.finalize();
    var length = request.contentLength ?? 1;

    var r = await HttpClient().postUrl(request.url);
    r.headers.set(HttpHeaders.contentTypeHeader, request.headers[HttpHeaders.contentTypeHeader]!);
    r.headers.set(HttpHeaders.authorizationHeader, "Bearer $_accessToken");

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

  static Future<StreamedResponse> sendJsonContent(Request request) {
    request.headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    return send(request);
  }

  static Future<dynamic> get(String url) async {
    final Request request = Request("GET", generateUri(url));
    final response = await send(request);
      
    var decode = utf8.decode(await response.stream.toBytes());
    if(decode == '') return null;
    return jsonDecode(decode);
  }

  static Future<Uint8List> getBytes(String url) =>
    send(Request("GET", generateUri(url))).then((response) => response.stream.toBytes());

  static Future<dynamic> post(String url, { Map<String,Object?>? body }) async {
    final Request request = Request("POST", generateUri(url));
    request.body = jsonEncode(body);
    final response = await sendJsonContent(request);
    return jsonDecode(utf8.decode(await response.stream.toBytes()));
  }

  static Future<void> put(String url, { Map<String,Object?>? body }) async {
    final Request request = Request("PUT", generateUri(url));
    request.body = jsonEncode(body);
    await sendJsonContent(request);
  }

  static Future<void> delete(String url,{ Map<String,Object?>? body }) async {
    final Request request = Request("DELETE", generateUri(url));
    request.body = jsonEncode(body);
    await sendJsonContent(request);
  }

  static String generatePaginationUrl(String url, Page page){
    if(page.offset == null){
      return "$url?take=${page.take}&isDescending=${page.isDescending}";
    }
    return "$url?offset=${page.offset}&take=${page.take}&isDescending=${page.isDescending}";
  }
}