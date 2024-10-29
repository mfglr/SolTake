import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/image_state/image_state.dart';
import 'package:my_social_app/state/app_state/image_state/image_status.dart';

@immutable
class QuestionImageState extends ImageState{
  final int id;
  final int questionId;
  final String? blobName;

  const QuestionImageState({
    required this.id,
    required this.questionId,
    required super.height,
    required super.width,
    required this.blobName,
    required super.state,
    required super.data,
  });
  
  QuestionImageState startLoding(){
    if(state != ImageStatus.notStarted) return this;
    return QuestionImageState(
      id: id,
      questionId: questionId,
      height: height, 
      width: width,
      blobName: blobName,
      state: ImageStatus.started,
      data: data,
    );
  }

  QuestionImageState load(Uint8List data)
    => QuestionImageState(
        id: id,
        questionId: questionId,
        height: height, 
        width: width,
        blobName: blobName,
        state: ImageStatus.done,
        data: data,
      );

  QuestionImageState notFound()
    => QuestionImageState(
        id: id,
        questionId: questionId,
        height: height,
        width: width,
        blobName: blobName,
        state: ImageStatus.notFound,
        data: data
      );
}
