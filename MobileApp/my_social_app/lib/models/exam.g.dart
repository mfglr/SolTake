// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      initialism: json['initialism'] as String,
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'initialism': instance.initialism,
    };
