// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionImage _$QuestionImageFromJson(Map<String, dynamic> json) =>
    QuestionImage(
      id: (json['id'] as num).toInt(),
      questionId: (json['questionId'] as num).toInt(),
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      blobName: json['blobName'] as String,
    );

Map<String, dynamic> _$QuestionImageToJson(QuestionImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionId': instance.questionId,
      'height': instance.height,
      'width': instance.width,
      'blobName': instance.blobName,
    };
