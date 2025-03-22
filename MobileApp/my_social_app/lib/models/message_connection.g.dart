// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageConnection _$MessageConnectionFromJson(Map<String, dynamic> json) =>
    MessageConnection(
      id: (json['id'] as num).toInt(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userName: json['userName'] as String,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
      typingId: (json['typingId'] as num?)?.toInt(),
      state: (json['state'] as num).toInt(),
    );

Map<String, dynamic> _$MessageConnectionToJson(MessageConnection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userName': instance.userName,
      'image': instance.image,
      'typingId': instance.typingId,
      'state': instance.state,
    };
