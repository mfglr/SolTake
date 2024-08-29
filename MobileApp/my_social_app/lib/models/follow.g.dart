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
      follower: json['follower'] == null
          ? null
          : User.fromJson(json['follower'] as Map<String, dynamic>),
      followed: json['followed'] == null
          ? null
          : User.fromJson(json['followed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
      'id': instance.id,
      'followerId': instance.followerId,
      'followedId': instance.followedId,
      'createdAt': instance.createdAt.toIso8601String(),
      'follower': instance.follower,
      'followed': instance.followed,
    };
