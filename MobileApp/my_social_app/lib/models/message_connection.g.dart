// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageConnection _$MessageConnectionFromJson(Map<String, dynamic> json) =>
    MessageConnection(
      id: (json['id'] as num).toInt(),
      lastSeenAt: json['lastSeenAt'] == null
          ? null
          : DateTime.parse(json['lastSeenAt'] as String),
      userName: json['userName'] as String,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
      userId: (json['userId'] as num?)?.toInt(),
      state: (json['state'] as num).toInt(),
    );

Map<String, dynamic> _$MessageConnectionToJson(MessageConnection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastSeenAt': instance.lastSeenAt?.toIso8601String(),
      'userName': instance.userName,
      'image': instance.image,
      'userId': instance.userId,
      'state': instance.state,
    };
