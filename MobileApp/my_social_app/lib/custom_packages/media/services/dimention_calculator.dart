import 'package:media_info/media_info.dart';
import 'package:my_social_app/custom_packages/media/models/dimention.dart';

class DimentionCalculator {
  static final MediaInfo _mediaInfo = MediaInfo();

  static Future<Dimention> calculate(String path) =>
    _mediaInfo
      .getMediaInfo(path)
      .then((info) => Dimention(width: info["width"].toDouble(), height: info["height"].toDouble()));
}