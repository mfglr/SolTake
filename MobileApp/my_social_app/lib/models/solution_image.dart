import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/solution_image_entity_state/solution_image_state.dart';
part 'solution_image.g.dart';

@immutable
@JsonSerializable()
class SolutionImage{
  final int id;
  final int solutionId;
  final String blobName;
  final double height;
  final double width;

  const SolutionImage({
    required this.id,
    required this.solutionId,
    required this.blobName,
    required this.height,
    required this.width
  });

  factory SolutionImage.fromJson(Map<String, dynamic> json) => _$SolutionImageFromJson(json);
  Map<String, dynamic> toJson() => _$SolutionImageToJson(this);

  SolutionImageState toSolutionImageState()
   => SolutionImageState(
      id: id,
      solutionId: solutionId,
      blobName: blobName,
      height: height,
      width: width,
      state: ImageState.notStarted,
      image: null,
    );
}