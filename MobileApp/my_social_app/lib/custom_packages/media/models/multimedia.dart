import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/custom_packages/media/models/dimention.dart';
import 'package:my_social_app/custom_packages/media/models/media.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia_type.dart';
import 'package:my_social_app/custom_packages/media/models/remote_image.dart';
import 'package:my_social_app/custom_packages/media/models/remote_video.dart';
part 'multimedia.g.dart';

@JsonSerializable()
@immutable
class Multimedia{
  final String containerName;
  final String blobName;
  final String? blobNameOfFrame;
  final int size;
  final double height;
  final double width;
  final double duration;
  final MultimediaType multimediaType;

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

  Media toMedia() => 
    multimediaType == MultimediaType.image
      ? RemoteImage(
          blobName: blobName,
          containerName: containerName,
          dimention: Dimention(width: width, height: height),
          size: size
        )
      : RemoteVideo(
          blobName: blobName,
          containerName: containerName,
          dimention: Dimention(width: width, height: height),
          size: size,
          blobNameOfFrame: blobNameOfFrame!,
          duration: duration
        );
}