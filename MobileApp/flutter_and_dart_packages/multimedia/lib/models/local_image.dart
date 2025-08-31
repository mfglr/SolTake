import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:multimedia/models/media.dart';
import 'package:multimedia/models/multimedia_status.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:multimedia/models/uploadable.dart';

@immutable
class LocalImage extends Media implements Uploadable{
  @override
  final double downloadRate;
  @override
  final MultimediaStatus uploadStatus;
  final Uint8List bytes;

  const LocalImage._({
    required this.downloadRate,
    required this.uploadStatus,
    required this.bytes,
    super.type = MultimediaType.image
  });

  const LocalImage({
    required this.bytes,
    super.type = MultimediaType.image
  }) :
    downloadRate = 0,
    uploadStatus = MultimediaStatus.created;
  
  @override
  LocalImage startUpload() =>
    LocalImage._(
      downloadRate: downloadRate,
      uploadStatus: MultimediaStatus.started,
      bytes: bytes,
    );

  @override
  LocalImage changeUploadRate(double rate) => 
    LocalImage._(
      downloadRate: rate,
      uploadStatus: uploadStatus,
      bytes: bytes,
    );
    
  @override
  LocalImage completeUpload() =>
    LocalImage._(
      downloadRate: 1,
      uploadStatus: MultimediaStatus.completed,
      bytes: bytes,
    );
    
  LocalImage loadBytes(Uint8List list) =>
    LocalImage._(
      downloadRate: downloadRate,
      uploadStatus: uploadStatus,
      bytes: bytes,
    );
}