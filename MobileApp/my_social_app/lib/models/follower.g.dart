// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Follower _$FollowerFromJson(Map<String, dynamic> json) => Follower(
      id: (json['id'] as num).toInt(),
      followerId: (json['followerId'] as num).toInt(),
      userName: json['userName'] as String,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
      isFollower: json['isFollower'] as bool,
      isFollowed: json['isFollowed'] as bool,
    );

Map<String, dynamic> _$FollowerToJson(Follower instance) => <String, dynamic>{
      'id': instance.id,
      'followerId': instance.followerId,
      'userName': instance.userName,
      'name': instance.name,
      'image': instance.image,
      'isFollower': instance.isFollower,
      'isFollowed': instance.isFollowed,
    };
