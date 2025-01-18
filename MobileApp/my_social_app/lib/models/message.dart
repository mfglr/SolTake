import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
part 'message.g.dart';

@immutable
@JsonSerializable()
class Message{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isOwner;
  final String userName;
  final int conversationId;
  final int senderId;
  final int receiverId;
  final bool isEdited;
  final String? content; 
  final int state;
  final Iterable<Multimedia> medias;
  final Multimedia? image;
  
  const Message({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isOwner,
    required this.userName,
    required this.conversationId,
    required this.senderId,
    required this.receiverId,
    required this.isEdited,
    required this.content,
    required this.state,
    required this.medias,
    required this.image
  });


  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  MessageState toMessageState()
    => MessageState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isOwner: isOwner,
        userName: userName,
        conversationId: conversationId,
        senderId: senderId,
        receiverId: receiverId,
        isEdited: isEdited,
        content: content,
        state: state,
        medias: medias,
        image: image
      );
}