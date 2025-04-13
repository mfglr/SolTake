// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_user_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryUserView _$StoryUserViewFromJson(Map<String, dynamic> json) =>
    StoryUserView(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryUserViewToJson(StoryUserView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'userId': instance.userId,
      'userName': instance.userName,
      'name': instance.name,
      'image': instance.image,
    };
