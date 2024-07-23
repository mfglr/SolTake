// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolutionImage _$SolutionImageFromJson(Map<String, dynamic> json) =>
    SolutionImage(
      id: (json['id'] as num).toInt(),
      solutionId: (json['solutionId'] as num).toInt(),
      blobName: json['blobName'] as String,
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$SolutionImageToJson(SolutionImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'solutionId': instance.solutionId,
      'blobName': instance.blobName,
      'height': instance.height,
      'width': instance.width,
    };
