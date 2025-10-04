import 'dart:typed_data';
import 'package:my_social_app/constants/controllers.dart';
import 'package:my_social_app/services/app_client.dart';

class FrameCatcherService{
  final AppClient _appClient;
  
  const FrameCatcherService._(this._appClient);
  static final FrameCatcherService _singleton = FrameCatcherService._(AppClient());
  factory FrameCatcherService() => _singleton;

  Future<Uint8List> catchFrame(String containerName, String blobName, int positionMs) =>
    _appClient.getBytes("$frameCatcherController/$containerName/$blobName/$positionMs");
}