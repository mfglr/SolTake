import 'package:cross_file/cross_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:multimedia/models/media.dart';
import 'package:multimedia/models/multimedia_status.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:multimedia/models/uploadable.dart';

@immutable
class LocalVideo extends Media implements Uploadable{
  @override
  final double downloadRate;
  @override
  final MultimediaStatus uploadStatus;
  final XFile file;

  const LocalVideo._({
    required this.downloadRate,
    required this.file,
    required this.uploadStatus,
    super.type = MultimediaType.video,
  });

  const LocalVideo({
    required this.file,
    super.type = MultimediaType.video,
  }) :
    downloadRate = 0,
    uploadStatus = MultimediaStatus.created;

  @override
  LocalVideo startUpload() =>
    LocalVideo._(
      downloadRate: downloadRate,
      uploadStatus: MultimediaStatus.started,
      file: file
    );

  @override
  LocalVideo changeUploadRate(double rate) => 
    LocalVideo._(
      downloadRate: rate,
      uploadStatus: uploadStatus,
      file: file
    );
    
  @override
  LocalVideo completeUpload() =>
    LocalVideo._(
      downloadRate: 1,
      uploadStatus: MultimediaStatus.completed,
      file: file
    );
}