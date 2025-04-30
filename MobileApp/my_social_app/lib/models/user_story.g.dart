// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStory _$UserStoryFromJson(Map<String, dynamic> json) => UserStory(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isViewed: json['isViewed'] as bool,
      media: Multimedia.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStoryToJson(UserStory instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'isViewed': instance.isViewed,
      'media': instance.media,
    };
