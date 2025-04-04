// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      id: (json['id'] as num).toInt(),
      storyId: (json['storyId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
      media: Multimedia.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'storyId': instance.storyId,
      'userId': instance.userId,
      'userName': instance.userName,
      'image': instance.image,
      'media': instance.media,
    };
