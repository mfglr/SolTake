import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:my_social_app/constants/account_endpoints.dart';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/models/account.dart';
import 'package:my_social_app/state/account_state/actions.dart';
import 'package:my_social_app/state/store.dart';

class AppClient{
  static final _apiUrl = "${dotenv.env['API_URL']}/api";

  const AppClient._();
  static const AppClient _singleton = AppClient._();
  factory AppClient() => _singleton;

  Map<String,String> _setAuthenticationToken(){
    final Map<String,String> headers = {};
    if(store.state.accessToken != null){
      headers.addAll({ "Authorization" : "Bearer ${store.state.accessToken}"});
    }
    return headers;
  }

  Uri generateUri(String url) => Uri.parse("$_apiUrl/$url");

  Future<Account> _login() async {
    final account = store.state.accountState!;
    final url = Uri.parse("$_apiUrl/$accountController/$loginByRefreshTokenEndPoint");
    final Request request = Request("POST", url);
    request.headers.addAll({'Content-Type': 'application/json; charset=UTF-8'});
    request.body = jsonEncode({ 'id': account.id.toString(), 'token': account.refreshToken });

    final response = await request.send();
    
    final data = utf8.decode(await response.stream.toBytes());
    if(response.statusCode >= 400) throw BackendException( message: data );
    return Account.fromJson(jsonDecode(data));
  }

  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers.addAll(_setAuthenticationToken());
    var response = await request.send();
    if(response.statusCode >= 400){
      switch(response.statusCode){
        case 401:
          final newAccountState = (await _login()).toAccountState();
          store.dispatch(UpdateAccountStateAction(payload: newAccountState));
          response = await request.send();
          if(response.statusCode >= 400){
            throw BackendException(message: utf8.decode(await response.stream.toBytes()));
          }
        default:
          throw BackendException(message: utf8.decode(await response.stream.toBytes()));
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
    return jsonDecode(utf8.decode(await response.stream.toBytes()));
  }

  Future<Uint8List> getBytes(String url) async {
    final Request request = Request("GET", generateUri(url));
    final response = await send(request);
    return await response.stream.toBytes();
  }

  Future<Map<String,dynamic>> post(String url, { Map<String,Object?>? body }) async {
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

  String generatePaginationUrl(String url, dynamic lastId,int? take){
    if(lastId == null && take == null){ return url; }
    else if(lastId == null && take != null){ return "$url?take=$take"; }
    else if(lastId != null && take == null){ return "$url?lastId=$lastId"; }
    else { return "$url?lastId=$lastId&take=$take"; }
  }
  
}