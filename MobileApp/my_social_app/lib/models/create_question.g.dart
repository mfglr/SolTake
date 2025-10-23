// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQuestion _$CreateQuestionFromJson(Map<String, dynamic> json) =>
    CreateQuestion(
      id: (json['id'] as num).toInt(),
      medias: (json['medias'] as List<dynamic>)
          .map((e) => Multimedia.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$CreateQuestionToJson(CreateQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medias': instance.medias.toList(),
    };
