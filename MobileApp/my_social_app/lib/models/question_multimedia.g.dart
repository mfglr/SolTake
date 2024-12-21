// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_multimedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionMultimedia _$QuestionMultimediaFromJson(Map<String, dynamic> json) =>
    QuestionMultimedia(
      id: (json['id'] as num).toInt(),
      questionId: (json['questionId'] as num).toInt(),
      containerName: json['containerName'] as String,
      blobName: json['blobName'] as String,
      blobNameOfFrame: json['blobNameOfFrame'] as String,
      size: (json['size'] as num).toInt(),
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      duration: (json['duration'] as num).toDouble(),
      multimediaType: (json['multimediaType'] as num).toInt(),
    );

Map<String, dynamic> _$QuestionMultimediaToJson(QuestionMultimedia instance) =>
    <String, dynamic>{
      'containerName': instance.containerName,
      'blobName': instance.blobName,
      'blobNameOfFrame': instance.blobNameOfFrame,
      'size': instance.size,
      'height': instance.height,
      'width': instance.width,
      'duration': instance.duration,
      'multimediaType': instance.multimediaType,
      'id': instance.id,
      'questionId': instance.questionId,
    };
