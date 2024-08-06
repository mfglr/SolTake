// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageImage _$MessageImageFromJson(Map<String, dynamic> json) => MessageImage(
      id: (json['id'] as num).toInt(),
      messageId: (json['messageId'] as num).toInt(),
      blobName: json['blobName'] as String,
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$MessageImageToJson(MessageImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messageId': instance.messageId,
      'blobName': instance.blobName,
      'height': instance.height,
      'width': instance.width,
    };
