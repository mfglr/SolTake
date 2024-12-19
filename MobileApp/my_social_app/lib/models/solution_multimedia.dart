import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/enums/multimedia_type.dart';
import 'package:my_social_app/models/multimedia.dart';
import 'package:my_social_app/state/app_state/multimedia_state/multimedia_status.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_multimedia_state.dart';
part 'solution_multimedia.g.dart';

@immutable
@JsonSerializable()
class SolutionMultimedia extends Multimedia{
  final int id;
  final int solutionId;

  const SolutionMultimedia({
    required this.id,
    required this.solutionId,
    required super.containerName,
    required super.blobName,
    required super.size,
    required super.height,
    required super.width,
    required super.duration,
    required super.multimediaType
    
  });

  factory SolutionMultimedia.fromJson(Map<String, dynamic> json) => _$SolutionMultimediaFromJson(json);
  Map<String, dynamic> toJson() => _$SolutionMultimediaToJson(this);

  SolutionMultimediaState toSolutionImageState()
   => SolutionMultimediaState(
      id: id,
      solutionId: solutionId,
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