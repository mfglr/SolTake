import 'package:flutter/cupertino.dart';
import 'package:my_social_app/media/models/local_media.dart';
import 'package:my_social_app/media/models/multimedia_status.dart';
import 'package:my_social_app/media/models/multimedia_type.dart';
import 'package:my_social_app/media/models/uploadable.dart';

@immutable
class LocalVideo extends LocalMedia implements Uploadable{
  @override
  final double downloadRate;
  @override
  final MultimediaStatus uploadStatus;

  const LocalVideo._({
    required super.file,
    required this.downloadRate,
    required this.uploadStatus,
    super.type = MultimediaType.video,
  });

  const LocalVideo({
    required super.file,
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