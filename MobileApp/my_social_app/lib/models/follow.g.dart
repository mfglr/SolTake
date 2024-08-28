// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Follow _$FollowFromJson(Map<String, dynamic> json) => Follow(
      id: (json['id'] as num).toInt(),
      followerId: (json['followerId'] as num).toInt(),
      followedId: (json['followedId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
      'id': instance.id,
      'followerId': instance.followerId,
      'followedId': instance.followedId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
