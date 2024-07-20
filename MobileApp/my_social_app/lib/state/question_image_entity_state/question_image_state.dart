import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/image_state.dart';

@immutable
class QuestionImageState{
  final int id;
  final int questionId;
  final double height;
  final double width;
  final String? blobName;
  final ImageState state;
  final Uint8List? image;
  final XFile? file;

  const QuestionImageState({
    required this.id,
    required this.questionId,
    required this.height,
    required this.width,
    required this.blobName,
    required this.state,
    required this.image,
    required this.file,
  });


  QuestionImageState startLoading()
    => QuestionImageState(
        id:id,
        questionId: questionId,
        height: height,
        width: width,
        blobName: blobName,
        state: ImageState.started,
        image: image,
        file: file
      );
  QuestionImageState load(Uint8List image)
    => QuestionImageState(
        id: id,
        questionId: questionId,
        height: height, 
        width: width,
        blobName: blobName,
        state: ImageState.done,
        image: image,
        file: file
      );
}
