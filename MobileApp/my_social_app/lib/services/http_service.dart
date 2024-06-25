import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:my_social_app/interceptors/http_intercepter.dart';

abstract class HttpService{
  static final String? baseUrl = dotenv.env['API_URL'];
  final client = HttpIntercepter(http.Client());

  Future<http.Response> get(String url) async {
    return await client.get(Uri.parse("$baseUrl/$url"));
  }

  Future<Map<String, dynamic>> post(String url,{Object? requestBody}) async {
    final response = await client.post(
      Uri.parse("$baseUrl/$url"),
      headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
      body: requestBody
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future put(String url,{Object? requestBody}) async {
    await client.put(
      Uri.parse("$baseUrl/$url"),
      headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
      body: requestBody
    );
  }

}