// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AIModel _$AIModelFromJson(Map<String, dynamic> json) => AIModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      solPerInputToken: (json['solPerInputToken'] as num).toInt(),
      solPerOutputToken: (json['solPerOutputToken'] as num).toInt(),
      image: Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AIModelToJson(AIModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'solPerInputToken': instance.solPerInputToken,
      'solPerOutputToken': instance.solPerOutputToken,
      'image': instance.image,
    };
