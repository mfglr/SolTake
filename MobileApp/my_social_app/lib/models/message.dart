import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/message_image.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
part 'message.g.dart';

@immutable
@JsonSerializable()
class Message{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEdited;
  final int receiverId;
  final int senderId;
  final String senderUserName;
  final String receiverUserName;
  final String? content; 
  final int state;
  final Iterable<MessageImage> images;

  const Message({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isEdited,
    required this.senderUserName,
    required this.receiverUserName,
    required this.receiverId,
    required this.senderId,
    required this.content,
    required this.state,
    required this.images,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  MessageState toMessageState()
    => MessageState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        senderId: senderId,
        isEdited: isEdited,
        senderUserName: senderUserName,
        receiverUserName: receiverUserName,
        receiverId: receiverId,
        content: content,
        state: state,
        images: images.map((e) => e.toMessageImageState()),
      );
}