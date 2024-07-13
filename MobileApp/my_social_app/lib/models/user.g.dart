// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      (json['id'] as num).toInt(),
      DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['userName'] as String,
      json['name'] as String?,
      (json['gender'] as num).toInt(),
      json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      (json['profileVisibility'] as num).toInt(),
      (json['numberOfQuestions'] as num).toInt(),
      (json['numberOfFollowers'] as num).toInt(),
      (json['numberOfFolloweds'] as num).toInt(),
      json['isFollower'] as bool,
      json['isFollowed'] as bool,
      json['isRequester'] as bool,
      json['isRequested'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userName': instance.userName,
      'name': instance.name,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'profileVisibility': instance.profileVisibility,
      'numberOfQuestions': instance.numberOfQuestions,
      'numberOfFollowers': instance.numberOfFollowers,
      'numberOfFolloweds': instance.numberOfFolloweds,
      'isFollower': instance.isFollower,
      'isFollowed': instance.isFollowed,
      'isRequester': instance.isRequester,
      'isRequested': instance.isRequested,
    };
