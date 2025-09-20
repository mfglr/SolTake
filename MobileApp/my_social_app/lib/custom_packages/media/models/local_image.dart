import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:my_social_app/custom_packages/media/models/local_media.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_type.dart';

@immutable
class LocalImage extends LocalMedia{
  const LocalImage({
    required super.file,
    required super.dimention,
  }) :
      super(type: MultimediaType.image);

  const LocalImage._({
    required super.file,
    required super.dimention,
  }) : super(type: MultimediaType.image);
    
  LocalImage loadBytes(Uint8List list) =>
    LocalImage._(
      file: file,
      dimention: dimention,
    );
}