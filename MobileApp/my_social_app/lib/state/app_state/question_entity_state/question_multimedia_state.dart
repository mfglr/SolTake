import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';

@immutable
class QuestionMultimediaState extends MultimediaState{
  final int id;
  final int questionId;

  const QuestionMultimediaState({
    required this.id,
    required this.questionId,
    required super.containerName,
    required super.blobName,
    required super.blobNameOfFrame,
    required super.size,
    required super.height,
    required super.width,
    required super.duration,
    required super.multimediaType,
  });
  
}
