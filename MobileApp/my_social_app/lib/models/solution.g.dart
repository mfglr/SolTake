// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Solution _$SolutionFromJson(Map<String, dynamic> json) => Solution(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      questionId: (json['questionId'] as num).toInt(),
      appUserId: (json['appUserId'] as num).toInt(),
      userName: json['userName'] as String,
      content: json['content'] as String,
      state: (json['state'] as num).toInt(),
      numberOfUpvotes: (json['numberOfUpvotes'] as num).toInt(),
      numberOfDownvotes: (json['numberOfDownvotes'] as num).toInt(),
      isOwner: json['isOwner'] as bool,
      images: (json['images'] as List<dynamic>)
          .map((e) => SolutionImage.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$SolutionToJson(Solution instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'questionId': instance.questionId,
      'appUserId': instance.appUserId,
      'userName': instance.userName,
      'content': instance.content,
      'state': instance.state,
      'numberOfUpVotes': instance.numberOfUpvotes,
      'numberOfDownVotes': instance.numberOfDownvotes,
      'isOwner': instance.isOwner,
      'images': instance.images.toList(),
    };
