// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_multimedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolutionMultimedia _$SolutionMultimediaFromJson(Map<String, dynamic> json) =>
    SolutionMultimedia(
      id: (json['id'] as num).toInt(),
      solutionId: (json['solutionId'] as num).toInt(),
      containerName: json['containerName'] as String,
      blobName: json['blobName'] as String,
      size: (json['size'] as num).toInt(),
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      duration: (json['duration'] as num).toDouble(),
      multimediaType:
          $enumDecode(_$MultimediaTypeEnumMap, json['multimediaType']),
    );

Map<String, dynamic> _$SolutionMultimediaToJson(SolutionMultimedia instance) =>
    <String, dynamic>{
      'containerName': instance.containerName,
      'blobName': instance.blobName,
      'size': instance.size,
      'height': instance.height,
      'width': instance.width,
      'duration': instance.duration,
      'multimediaType': _$MultimediaTypeEnumMap[instance.multimediaType]!,
      'id': instance.id,
      'solutionId': instance.solutionId,
    };

const _$MultimediaTypeEnumMap = {
  MultimediaType.image: 'image',
  MultimediaType.video: 'video',
  MultimediaType.audio: 'audio',
};
