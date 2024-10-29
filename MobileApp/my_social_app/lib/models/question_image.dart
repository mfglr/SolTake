import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/image_state/image_status.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_image_state.dart';
part 'question_image.g.dart';

@immutable
@JsonSerializable()
class QuestionImage{
  final int id;
  final int questionId;
  final double height;
  final double width;
  final String blobName;
  
  const QuestionImage({
    required this.id,
    required this.questionId,
    required this.height,
    required this.width,
    required this.blobName
  });

  factory QuestionImage.fromJson(Map<String, dynamic> json) => _$QuestionImageFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionImageToJson(this);

  QuestionImageState toQuestionImageState()
    => QuestionImageState(
        id: id,
        questionId: questionId,
        height: height,
        width: width,
        blobName: blobName,
        state: ImageStatus.notStarted,
        data: null,
      );
}
