import 'package:flutter/cupertino.dart';
import 'package:multimedia/models/multimedia_type.dart';

@immutable
abstract class Media{
  static const Map<MultimediaType,String> _contentTypes = {
    MultimediaType.image: "image",
    MultimediaType.video: "video"
  };

  const Media({required this.type});

  final MultimediaType type;
  String get contentType => _contentTypes[type]!;
}