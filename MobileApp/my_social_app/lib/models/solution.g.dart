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
      isOwner: json['isOwner'] as bool,
      isSaved: json['isSaved'] as bool,
      userName: json['userName'] as String,
      content: json['content'] as String?,
      isUpvoted: json['isUpvoted'] as bool,
      numberOfUpvotes: (json['numberOfUpvotes'] as num).toInt(),
      isDownvoted: json['isDownvoted'] as bool,
      numberOfDownvotes: (json['numberOfDownvotes'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => SolutionImage.fromJson(e as Map<String, dynamic>)),
      numberOfComments: (json['numberOfComments'] as num).toInt(),
      state: (json['state'] as num).toInt(),
    );

Map<String, dynamic> _$SolutionToJson(Solution instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'questionId': instance.questionId,
      'appUserId': instance.appUserId,
      'isOwner': instance.isOwner,
      'isSaved': instance.isSaved,
      'userName': instance.userName,
      'content': instance.content,
      'isUpvoted': instance.isUpvoted,
      'numberOfUpvotes': instance.numberOfUpvotes,
      'isDownvoted': instance.isDownvoted,
      'numberOfDownvotes': instance.numberOfDownvotes,
      'images': instance.images.toList(),
      'numberOfComments': instance.numberOfComments,
      'state': instance.state,
    };
