// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionImage _$QuestionImageFromJson(Map<String, dynamic> json) =>
    QuestionImage(
      height: (json['height'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      blobName: json['blobName'] as String,
    );

Map<String, dynamic> _$QuestionImageToJson(QuestionImage instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'blobName': instance.blobName,
    };
