import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:my_social_app/media/models/local_media.dart';
import 'package:my_social_app/media/models/multimedia_status.dart';
import 'package:my_social_app/media/models/multimedia_type.dart';

@immutable
class LocalImage extends LocalMedia{
  @override
  final double downloadRate;
  @override
  final MultimediaStatus uploadStatus;

  const LocalImage({required super.file})
    : downloadRate = 0, 
      uploadStatus = MultimediaStatus.created,
      super(type: MultimediaType.image);

  const LocalImage._({
    required super.file,
    required this.downloadRate,
    required this.uploadStatus
  }) : super(type: MultimediaType.image);

  @override
  LocalImage startUpload() =>
    LocalImage._(
      file: file,
      downloadRate: downloadRate,
      uploadStatus: MultimediaStatus.started,
    );

  @override
  LocalImage changeUploadRate(double rate) => 
    LocalImage._(
      file: file,
      downloadRate: rate,
      uploadStatus: uploadStatus,
    );
    
  @override
  LocalImage completeUpload() =>
    LocalImage._(
      file: file,
      downloadRate: 1,
      uploadStatus: MultimediaStatus.completed,
    );
    
  LocalImage loadBytes(Uint8List list) =>
    LocalImage._(
      file: file,
      downloadRate: downloadRate,
      uploadStatus: uploadStatus,
    );
}