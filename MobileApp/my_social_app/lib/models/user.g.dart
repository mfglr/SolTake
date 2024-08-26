// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      hasImage: json['hasImage'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userName: json['userName'] as String,
      name: json['name'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: (json['gender'] as num).toInt(),
      numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
      numberOfFollowers: (json['numberOfFollowers'] as num).toInt(),
      numberOfFolloweds: (json['numberOfFolloweds'] as num).toInt(),
      isFollower: json['isFollower'] as bool,
      isFollowed: json['isFollowed'] as bool,
      likeId: (json['likeId'] as num).toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userName': instance.userName,
      'name': instance.name,
      'hasImage': instance.hasImage,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'numberOfQuestions': instance.numberOfQuestions,
      'numberOfFollowers': instance.numberOfFollowers,
      'numberOfFolloweds': instance.numberOfFolloweds,
      'isFollower': instance.isFollower,
      'isFollowed': instance.isFollowed,
      'likeId': instance.likeId
    };
