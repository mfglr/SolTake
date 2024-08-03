// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
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
      profileVisibility: (json['profileVisibility'] as num).toInt(),
      numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
      numberOfFollowers: (json['numberOfFollowers'] as num).toInt(),
      numberOfFolloweds: (json['numberOfFolloweds'] as num).toInt(),
      numberOfUnviewedNotifications:
          (json['numberOfUnviewedNotifications'] as num).toInt(),
      isFollower: json['isFollower'] as bool,
      isFollowed: json['isFollowed'] as bool,
      isRequester: json['isRequester'] as bool,
      isRequested: json['isRequested'] as bool,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>)),
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
      'numberOfUnviewedNotifications': instance.numberOfUnviewedNotifications,
      'isFollower': instance.isFollower,
      'isFollowed': instance.isFollowed,
      'isRequester': instance.isRequester,
      'isRequested': instance.isRequested,
      'messages': instance.messages.toList(),
    };
