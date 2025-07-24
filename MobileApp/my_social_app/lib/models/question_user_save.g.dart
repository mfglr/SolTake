// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_user_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionUserSave _$QuestionUserSaveFromJson(Map<String, dynamic> json) =>
    QuestionUserSave(
      id: (json['id'] as num).toInt(),
      questionId: (json['questionId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isOwner: json['isOwner'] as bool,
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      content: json['content'] as String?,
      exam: Exam.fromJson(json['exam'] as Map<String, dynamic>),
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      topic: json['topic'] == null
          ? null
          : Topic.fromJson(json['topic'] as Map<String, dynamic>),
      medias: (json['medias'] as List<dynamic>)
          .map((e) => Multimedia.fromJson(e as Map<String, dynamic>)),
      isLiked: json['isLiked'] as bool,
      isSaved: json['isSaved'] as bool,
      publishingState: (json['publishingState'] as num).toInt(),
      numberOfLikes: (json['numberOfLikes'] as num).toInt(),
      numberOfSolutions: (json['numberOfSolutions'] as num).toInt(),
      numberOfCorrectSolutions:
          (json['numberOfCorrectSolutions'] as num).toInt(),
      numberOfVideoSolutions: (json['numberOfVideoSolutions'] as num).toInt(),
      numberOfComments: (json['numberOfComments'] as num).toInt(),
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionUserSaveToJson(QuestionUserSave instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionId': instance.questionId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
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
      'publishingState': instance.publishingState,
      'numberOfLikes': instance.numberOfLikes,
      'numberOfSolutions': instance.numberOfSolutions,
      'numberOfCorrectSolutions': instance.numberOfCorrectSolutions,
      'numberOfVideoSolutions': instance.numberOfVideoSolutions,
      'numberOfComments': instance.numberOfComments,
      'image': instance.image,
    };
