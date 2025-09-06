import 'package:flutter/cupertino.dart';
import 'package:my_social_app/media/models/multimedia_type.dart';
import 'package:my_social_app/media/models/remote_media.dart';

@immutable
class RemoteVideo extends RemoteMedia{
  final String? blobNameOfFrame;
  final double duration;

  const RemoteVideo({
    required super.blobName,
    required super.containerName,
    required super.dimention,
    required super.size,
    required this.blobNameOfFrame,
    required this.duration,
    super.type = MultimediaType.video,
  });
}