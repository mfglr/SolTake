// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_user_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUserConversation _$UserUserConversationFromJson(
        Map<String, dynamic> json) =>
    UserUserConversation(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUserConversationToJson(
        UserUserConversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'name': instance.name,
      'image': instance.image,
    };
