// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isEdited: json['isEdited'] as bool,
      senderUserName: json['senderUserName'] as String,
      receiverUserName: json['receiverUserName'] as String,
      receiverId: (json['receiverId'] as num).toInt(),
      senderId: (json['senderId'] as num).toInt(),
      content: json['content'] as String?,
      state: (json['state'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => MessageImage.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isEdited': instance.isEdited,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'senderUserName': instance.senderUserName,
      'receiverUserName': instance.receiverUserName,
      'content': instance.content,
      'state': instance.state,
      'images': instance.images.toList(),
    };
