import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/image_status.dart';

@immutable
class QuestionImageState{
  final int id;
  final int questionId;
  final double height;
  final double width;
  final String? blobName;
  final ImageStatus state;
  final Uint8List? image;

  const QuestionImageState({
    required this.id,
    required this.questionId,
    required this.height,
    required this.width,
    required this.blobName,
    required this.state,
    required this.image,
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
      image: image,
    );
  }

  QuestionImageState load(Uint8List image)
    => QuestionImageState(
        id: id,
        questionId: questionId,
        height: height, 
        width: width,
        blobName: blobName,
        state: ImageStatus.done,
        image: image,
      );

  QuestionImageState notFound()
    => QuestionImageState(
        id: id,
        questionId: questionId,
        height: height,
        width: width,
        blobName: blobName,
        state: ImageStatus.notFound,
        image: image
      );
}
