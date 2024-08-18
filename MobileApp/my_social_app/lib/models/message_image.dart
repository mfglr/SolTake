import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/message_entity_state/message_image_state.dart';
part 'message_image.g.dart';

@immutable
@JsonSerializable()
class MessageImage{
  final int id;
  final int messageId;
  final String blobName;
  final double height;
  final double width;

  const MessageImage({
    required this.id,
    required this.messageId,
    required this.blobName,
    required this.height,
    required this.width
  });

  factory MessageImage.fromJson(Map<String, dynamic> json) => _$MessageImageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageImageToJson(this);

  MessageImageState toMessageImageState()
    => MessageImageState(
        id: id,
        messageId: messageId,
        blobName: blobName,
        height: height,
        width: width,
        image: null,
        status: ImageStatus.notStarted,
      );
}