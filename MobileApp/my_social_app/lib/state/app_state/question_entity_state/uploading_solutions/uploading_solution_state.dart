import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

@immutable
class UploadingSolutionState{
  final String id;
  final int questionId;
  final String? content;
  final XFile? video;
  final Iterable<XFile>? images;
  final double rate;

  const UploadingSolutionState({
    required this.id,
    required this.questionId,
    required this.content,
    required this.video,
    required this.images,
    required this.rate,
  });

  UploadingSolutionState changeRate(double rate)
    => UploadingSolutionState(
        id: id,
        questionId: questionId,
        content: content,
        images: images,
        video: video,
        rate: rate,
      );
}