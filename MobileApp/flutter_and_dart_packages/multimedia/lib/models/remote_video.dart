import 'package:flutter/cupertino.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:multimedia/models/remote_media.dart';

@immutable
class RemoteVideo extends RemoteMedia{
  final String? blobNameOfFrame;
  final double duration;

  const RemoteVideo({
    required super.blobName,
    required super.containerName,
    required super.height,
    required super.width,
    required super.size,
    required this.blobNameOfFrame,
    required this.duration,
    super.type = MultimediaType.video,
  });
}