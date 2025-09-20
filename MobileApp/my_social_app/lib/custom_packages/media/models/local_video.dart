import 'package:flutter/cupertino.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_type.dart';

@immutable
class LocalVideo extends LocalMedia{
  const LocalVideo({
    required super.file,
    required super.dimention,
    super.type = MultimediaType.video,
  });
}