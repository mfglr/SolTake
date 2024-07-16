// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionTopic _$QuestionTopicFromJson(Map<String, dynamic> json) =>
    QuestionTopic(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$QuestionTopicToJson(QuestionTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

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

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      appUserId: (json['appUserId'] as num).toInt(),
      userName: json['userName'] as String,
      content: json['content'] as String?,
      examId: (json['examId'] as num).toInt(),
      examName: json['examName'] as String,
      subjectId: (json['subjectId'] as num).toInt(),
      subjectName: json['subjectName'] as String,
      topics: (json['topics'] as List<dynamic>)
          .map((e) => QuestionTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => QuestionImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'appUserId': instance.appUserId,
      'userName': instance.userName,
      'content': instance.content,
      'examId': instance.examId,
      'examName': instance.examName,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'topics': instance.topics,
      'images': instance.images,
    };
