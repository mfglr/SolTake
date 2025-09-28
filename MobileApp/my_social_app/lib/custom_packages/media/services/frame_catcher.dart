import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:media_info/media_info.dart';
import 'package:my_social_app/custom_packages/media/models/local_video.dart';
import 'package:path_provider/path_provider.dart';

class FrameCatcher {
  static final MediaInfo _mediaInfo = MediaInfo();

  static String pathToName(String path,int positionMs) =>
    "${path.split("/").last}_$positionMs";

  static Future<Uint8List> catchFrame(LocalVideo video, {int positionMs = 0}) async {
    var tempPath = await getTemporaryDirectory();
    
    var dir = Directory("`${tempPath.path}/thumbnails");
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    var target = "${tempPath.path}/thumbnails/${pathToName(video.file.path,positionMs)}";
    var file = File(target);
    if(!await file.exists()){
      await _mediaInfo
        .generateThumbnail(
          video.file.path,
          target,
          video.dimention.width.toInt(),
          video.dimention.height.toInt()
        );
    }
    return await file.readAsBytes();
  }   
}