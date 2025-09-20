import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_status.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_type.dart';
import 'package:my_social_app/custom_packages/media/models/remote_media.dart';

@immutable
class RemoteImage extends RemoteMedia{
  final MultimediaStatus status;
  final Uint8List? bytes;

  const RemoteImage._({
    required super.blobName,
    required super.containerName,
    required super.dimention,
    required super.type,
    required super.size,
    required this.status,
    required this.bytes
  });

  const RemoteImage({
    required super.blobName,
    required super.containerName,
    required super.dimention,
    required super.size,
    super.type = MultimediaType.image,
  }) :
    status = MultimediaStatus.created,
    bytes = null;
  
  
  RemoteImage start() =>
    RemoteImage._(
      blobName: blobName,
      containerName: containerName,
      dimention: dimention,
      type: type,
      size: size,
      bytes: bytes,
      status: MultimediaStatus.started,
    );

  RemoteImage complete(Uint8List bytes) =>
    RemoteImage._(
      blobName: blobName,
      containerName: containerName,
      dimention: dimention,
      type: type,
      size: size,
      status: MultimediaStatus.completed,
      bytes: bytes
    );

  RemoteImage fail() =>
    RemoteImage._(
      blobName: blobName,
      containerName: containerName,
      dimention: dimention,
      type: type,
      size: size,
      status: MultimediaStatus.failed,
      bytes: bytes
    );

  RemoteImage noFound() =>
    RemoteImage._(
      blobName: blobName,
      containerName: containerName,
      dimention: dimention,
      type: type,
      size: size,
      status: MultimediaStatus.notFound,
      bytes: bytes
    );
}