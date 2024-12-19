import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/enums/multimedia_type.dart';
import 'package:my_social_app/models/multimedia.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_status.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_multimedia_state.dart';
part 'question_multimedia.g.dart';

@immutable
@JsonSerializable()
class QuestionMultimedia extends Multimedia{
  final int id;
  final int questionId;
  
  const QuestionMultimedia({
    required this.id,
    required this.questionId,
    required super.containerName,
    required super.blobName,
    required super.size,
    required super.height,
    required super.width,
    required super.duration,
    required super.multimediaType
  });

  factory QuestionMultimedia.fromJson(Map<String, dynamic> json) => _$QuestionMultimediaFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionMultimediaToJson(this);

  QuestionMultimediaState toQuestionMultimediaState()
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
        state: MultimediaStatus.notStarted,
        data: null,
      );
}
