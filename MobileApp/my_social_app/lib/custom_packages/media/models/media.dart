import 'package:flutter/cupertino.dart';
import 'package:my_social_app/custom_packages/media/models/dimention.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_type.dart';

@immutable
abstract class Media{
  static const Map<MultimediaType,String> _contentTypes = {
    MultimediaType.image: "image/noEx",
    MultimediaType.video: "video/noEx"
  };
  final Dimention dimention;

  const Media({
    required this.dimention,
    required this.type,
  });

  final MultimediaType type;

  String get contentType => _contentTypes[type]!;
}