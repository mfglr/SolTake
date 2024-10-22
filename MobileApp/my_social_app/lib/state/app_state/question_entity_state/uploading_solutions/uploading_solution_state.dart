import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/question_entity_state/uploading_solutions/uploading_solutioon_status.dart';

@immutable
class UploadingSolutionState{
  final String id;
  final int questionId;
  final String? content;
  final XFile? video;
  final Iterable<XFile>? images;
  final double rate;
  final UploadingSolutioonStatus status;

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
        status: UploadingSolutioonStatus.loading
      );
  UploadingSolutionState changeStatus(UploadingSolutioonStatus status)
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