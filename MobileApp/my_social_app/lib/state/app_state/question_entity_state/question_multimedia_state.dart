import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_state.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_status.dart';

@immutable
class QuestionMultimediaState extends MultimediaState{
  final int id;
  final int questionId;

  const QuestionMultimediaState({
    required this.id,
    required this.questionId,
    required super.containerName,
    required super.blobName,
    required super.size,
    required super.height,
    required super.width,
    required super.duration,
    required super.multimediaType,
    required super.state,
    required super.data,
  });
  
  QuestionMultimediaState startLoding(){
    if(state != MultimediaStatus.notStarted) return this;
    return QuestionMultimediaState(
      id: id,
      questionId: questionId,
      containerName: containerName,
      blobName: blobName,
      size: size,
      height: height, 
      width: width,
      duration: duration,
      multimediaType: multimediaType,
      state: MultimediaStatus.started,
      data: data,
    );
  }

  QuestionMultimediaState load(Uint8List data)
    => QuestionMultimediaState(
        id: id,
        questionId: questionId,
        containerName: containerName,
        blobName: blobName,
        size: size,
        height: height, 
        width: width,
        duration: duration,
        multimediaType: multimediaType,
        state: MultimediaStatus.done,
        data: data,
      );

  QuestionMultimediaState notFound()
    => QuestionMultimediaState(
        id: id,
        questionId: questionId,
        containerName: containerName,
        blobName: blobName,
        size: size,
        height: height,
        width: width,
        duration: duration,
        multimediaType: multimediaType,
        state: MultimediaStatus.notFound,
        data: data
      );
}
