import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IEnvProvider{
  String get apiUrl;
  String get blobServiceUrl;
  String get frameExtracterServiceUrl;
}


class EnvProvider implements IEnvProvider{
  @override String get apiUrl => dotenv.env["API_URL"]!;
  @override String get blobServiceUrl => "$apiUrl/blobs";
  @override String get frameExtracterServiceUrl => "$apiUrl/frameCatcher/catchFrame"; 
}