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
      biography: json['biography'] as String?,
      numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
      numberOfFollowers: (json['numberOfFollowers'] as num).toInt(),
      numberOfFolloweds: (json['numberOfFolloweds'] as num).toInt(),
      isFollower: json['isFollower'] as bool,
      isFollowed: json['isFollowed'] as bool,
      paginationKey: (json['paginationKey'] as num?)?.toInt(),
      paginationDate: json['paginationDate'] == null
          ? null
          : DateTime.parse(json['paginationDate'] as String),
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userName': instance.userName,
      'name': instance.name,
      'biography': instance.biography,
      'numberOfQuestions': instance.numberOfQuestions,
      'numberOfFollowers': instance.numberOfFollowers,
      'numberOfFolloweds': instance.numberOfFolloweds,
      'isFollower': instance.isFollower,
      'isFollowed': instance.isFollowed,
      'paginationKey': instance.paginationKey,
      'paginationDate': instance.paginationDate?.toIso8601String(),
      'image': instance.image,
    };
