import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/views/shared/uploading_circle/uploading_file_status.dart';

@immutable
class UploadingSolutionState{
  final String id;
  final int questionId;
  final String? content;
  final XFile? video;
  final Iterable<XFile>? images;
  final double rate;
  final UploadingFileStatus status;

  const UploadingSolutionState({
    required this.id,
    required this.questionId,
    required this.content,
    required this.video,
    required this.images,
    required this.rate,
    required this.status,
  });

  UploadingSolutionState changeRate(double rate)
    => UploadingSolutionState(
        id: id,
        questionId: questionId,
        content: content,
        images: images,
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
        images: images,
        rate: rate,
        status: status
      );
}