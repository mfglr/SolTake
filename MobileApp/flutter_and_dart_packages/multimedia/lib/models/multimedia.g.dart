// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multimedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Multimedia _$MultimediaFromJson(Map<String, dynamic> json) => Multimedia(
      containerName: json['containerName'] as String,
      blobName: json['blobName'] as String,
      blobNameOfFrame: json['blobNameOfFrame'] as String?,
      size: (json['size'] as num).toInt(),
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      duration: (json['duration'] as num).toDouble(),
      multimediaType: (json['multimediaType'] as num).toInt(),
    );

Map<String, dynamic> _$MultimediaToJson(Multimedia instance) =>
    <String, dynamic>{
      'containerName': instance.containerName,
      'blobName': instance.blobName,
      'blobNameOfFrame': instance.blobNameOfFrame,
      'size': instance.size,
      'height': instance.height,
      'width': instance.width,
      'duration': instance.duration,
      'multimediaType': instance.multimediaType,
    };
