// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isViewed: json['isViewed'] as bool,
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
      media: Multimedia.fromJson(json['media'] as Map<String, dynamic>),
      numberOfViewers: (json['numberOfViewers'] as num).toInt(),
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'isViewed': instance.isViewed,
      'userId': instance.userId,
      'userName': instance.userName,
      'image': instance.image,
      'media': instance.media,
      'numberOfViewers': instance.numberOfViewers,
    };
