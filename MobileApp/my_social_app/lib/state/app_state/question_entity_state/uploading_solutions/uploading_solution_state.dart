import 'package:app_file/app_file.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';

@immutable
class UploadingSolutionState{
  final String id;
  final int questionId;
  final String? content;
  final XFile? video;
  final Iterable<AppFile> medias;
  final double rate;
  final UploadingFileStatus status;

  const UploadingSolutionState({
    required this.id,
    required this.questionId,
    required this.content,
    required this.video,
    required this.medias,
    required this.rate,
    required this.status,
  });

  UploadingSolutionState changeRate(double rate)
    => UploadingSolutionState(
        id: id,
        questionId: questionId,
        content: content,
        medias: medias,
        video: video,
        rate: rate,
        status: UploadingFileStatus.loading
      );
  UploadingSolutionState changeStatus(UploadingFileStatus status)
    => UploadingSolutionState(
        id: id,
        questionId: questionId,
        content: content,
        video: video,
        medias: medias,
        rate: rate,
        status: status
      );
}