import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/question_entity_state/question_image_state.dart';
part 'question_image.g.dart';

@immutable
@JsonSerializable()
class QuestionImage{
  final int height;
  final int width;
  final String blobName;
  const QuestionImage({required this.height,required this.width,required this.blobName});

  factory QuestionImage.fromJson(Map<String, dynamic> json) => _$QuestionImageFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionImageToJson(this);

  QuestionImageState toQuestionImageState()
    => QuestionImageState(height: height,width: width,blobName: blobName, state: ImageState.notStarted,image: null,file: null);
}
