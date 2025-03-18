// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageConnection _$MessageConnectionFromJson(Map<String, dynamic> json) =>
    MessageConnection(
      id: (json['id'] as num).toInt(),
      typingId: (json['typingId'] as num?)?.toInt(),
      state: $enumDecode(_$MessageConnectionStatusEnumMap, json['state']),
    );

Map<String, dynamic> _$MessageConnectionToJson(MessageConnection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typingId': instance.typingId,
      'state': _$MessageConnectionStatusEnumMap[instance.state]!,
    };

const _$MessageConnectionStatusEnumMap = {
  MessageConnectionStatus.online: 'online',
  MessageConnectionStatus.ofline: 'ofline',
  MessageConnectionStatus.typing: 'typing',
};
