import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_status.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_type.dart';
import 'package:my_social_app/custom_packages/media/models/remote_media.dart';

@immutable
class RemoteVideo extends RemoteMedia{
  final String blobNameOfFrame;
  final MultimediaStatus statusOfFrame;
  final Uint8List? bytesOfFrame;
  final double duration;
 
  const RemoteVideo._({
    required super.dimention,
    required super.containerName,
    required super.blobName,
    required super.size,
    required this.blobNameOfFrame,
    required this.statusOfFrame,
    required this.bytesOfFrame,
    required this.duration
  }) : super(type: MultimediaType.image);

  const RemoteVideo({
    required super.blobName,
    required super.containerName,
    required super.dimention,
    required super.size,
    required this.blobNameOfFrame,
    required this.duration,
  }) :
    bytesOfFrame = null,
    statusOfFrame = MultimediaStatus.created,
    super(type: MultimediaType.video);

  RemoteVideo start() =>
    RemoteVideo._(
      containerName: containerName,
      blobName: blobName,
      blobNameOfFrame: blobNameOfFrame,
      dimention: dimention,
      duration: duration,
      size: size,
      bytesOfFrame: null,
      statusOfFrame: MultimediaStatus.started,
    );
  
  RemoteVideo complete(Uint8List bytesOfFrame) =>
    RemoteVideo._(
      containerName: containerName,
      blobName: blobName,
      blobNameOfFrame: blobNameOfFrame,
      dimention: dimention,
      duration: duration,
      size: size,
      bytesOfFrame: bytesOfFrame,
      statusOfFrame: MultimediaStatus.completed,
    );

  RemoteVideo fail() =>
    RemoteVideo._(
      containerName: containerName,
      blobName: blobName,
      blobNameOfFrame: blobNameOfFrame,
      dimention: dimention,
      duration: duration,
      size: size,
      bytesOfFrame: bytesOfFrame,
      statusOfFrame: MultimediaStatus.failed,
    );

  RemoteVideo notFound() =>
    RemoteVideo._(
      containerName: containerName,
      blobName: blobName,
      blobNameOfFrame: blobNameOfFrame,
      dimention: dimention,
      duration: duration,
      size: size,
      bytesOfFrame: bytesOfFrame,
      statusOfFrame: MultimediaStatus.notFound,
    );
  
}