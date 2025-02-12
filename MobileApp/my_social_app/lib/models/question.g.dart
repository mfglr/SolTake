// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      content: json['content'] as String?,
      topic: json['topic'] == null
          ? null
          : Topic.fromJson(json['topic'] as Map<String, dynamic>),
      exam: Exam.fromJson(json['exam'] as Map<String, dynamic>),
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      medias: (json['medias'] as List<dynamic>)
          .map((e) => Multimedia.fromJson(e as Map<String, dynamic>)),
      isLiked: json['isLiked'] as bool,
      isSaved: json['isSaved'] as bool,
      numberOfLikes: (json['numberOfLikes'] as num).toInt(),
      numberOfSolutions: (json['numberOfSolutions'] as num).toInt(),
      numberOfCorrectSolutions:
          (json['numberOfCorrectSolutions'] as num).toInt(),
      numberOfVideoSolutions: (json['numberOfVideoSolutions'] as num).toInt(),
      numberOfComments: (json['numberOfComments'] as num).toInt(),
      isOwner: json['isOwner'] as bool,
      state: (json['state'] as num).toInt(),
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'state': instance.state,
      'isOwner': instance.isOwner,
      'userId': instance.userId,
      'userName': instance.userName,
      'content': instance.content,
      'exam': instance.exam,
      'subject': instance.subject,
      'topic': instance.topic,
      'medias': instance.medias.toList(),
      'isLiked': instance.isLiked,
      'isSaved': instance.isSaved,
      'numberOfLikes': instance.numberOfLikes,
      'numberOfSolutions': instance.numberOfSolutions,
      'numberOfCorrectSolutions': instance.numberOfCorrectSolutions,
      'numberOfVideoSolutions': instance.numberOfVideoSolutions,
      'numberOfComments': instance.numberOfComments,
      'image': instance.image,
    };
