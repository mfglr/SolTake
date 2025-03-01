// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'followed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Followed _$FollowedFromJson(Map<String, dynamic> json) => Followed(
      id: (json['id'] as num).toInt(),
      followedId: (json['followedId'] as num).toInt(),
      userName: json['userName'] as String,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowedToJson(Followed instance) => <String, dynamic>{
      'id': instance.id,
      'followedId': instance.followedId,
      'userName': instance.userName,
      'name': instance.name,
      'image': instance.image,
    };
