import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

@immutable
class CreateSolutionState{
  final int? questionId;
  final String content;
  final Iterable<XFile> images;

  const CreateSolutionState({
    required this.questionId,
    required this.content,
    required this.images
  });

  CreateSolutionState changeQuestionId(int questionId)
    => CreateSolutionState(
        questionId: questionId,
        content: content,
        images: images
      );
  
  CreateSolutionState changeContent(String content)
    => CreateSolutionState(
        questionId: questionId,
        content: content,
        images: images
      );

  CreateSolutionState addImage(XFile image)
    => CreateSolutionState(
        questionId: questionId,
        content: content,
        images: images.followedBy([image])
      );
  
  CreateSolutionState removeImage(XFile image)
    => CreateSolutionState(
        questionId: questionId,
        content: content,
        images: images.where((e) => e != image)
      );

  CreateSolutionState clear()
    => const CreateSolutionState(
        content: "",
        images: [],
        questionId: null,
      );
}