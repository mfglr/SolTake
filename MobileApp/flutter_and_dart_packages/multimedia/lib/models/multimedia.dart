import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'multimedia.g.dart';

@immutable
@JsonSerializable()
class Multimedia{
  final String containerName;
  final String blobName;
  final String? blobNameOfFrame;
  final int size;
  final double height;
  final double width;
  final double duration;
  final int multimediaType;

  double get aspectRatio => width / height;
  
  const Multimedia({
    required this.containerName,
    required this.blobName,
    required this.blobNameOfFrame,
    required this.size,
    required this.height,
    required this.width,
    required this.duration,
    required this.multimediaType
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) => _$MultimediaFromJson(json);
  Map<String, dynamic> toJson() => _$MultimediaToJson(this);
}