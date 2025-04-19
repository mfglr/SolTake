import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia_status.dart';
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
  final Uint8List? data;
  final MultimediaStatus status;

  double get aspectRatio => width / height;
  
  const Multimedia({
    required this.containerName,
    required this.blobName,
    required this.blobNameOfFrame,
    required this.size,
    required this.height,
    required this.width,
    required this.duration,
    required this.multimediaType,
    this.data,
    this.status = MultimediaStatus.started
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) => _$MultimediaFromJson(json);
  Map<String, dynamic> toJson() => _$MultimediaToJson(this);

  Multimedia start() => 
    Multimedia(
      containerName: containerName,
      blobName: blobName,
      blobNameOfFrame: blobNameOfFrame,
      size: size,
      height: height,
      width: width,
      duration: duration,
      multimediaType: multimediaType,
      status: MultimediaStatus.started
    );

  Multimedia done(Uint8List data) =>
    Multimedia(
      containerName: containerName,
      blobName: blobName,
      blobNameOfFrame: blobNameOfFrame,
      size: size,
      height: height,
      width: width,
      duration: duration,
      multimediaType: multimediaType,
      status: MultimediaStatus.done,
      data: data
    );

  Multimedia notFound() =>
    Multimedia(
      containerName: containerName,
      blobName: blobName,
      blobNameOfFrame: blobNameOfFrame,
      size: size,
      height: height,
      width: width,
      duration: duration,
      multimediaType: multimediaType,
      status: MultimediaStatus.notFound
    );
}