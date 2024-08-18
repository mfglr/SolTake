import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/message_entity_state/message_image_state.dart';
import 'package:my_social_app/state/message_entity_state/message_stataus.dart';

@immutable
class MessageState{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEdited;
  final int senderId;
  final int receiverId;
  final String senderUserName;
  final String receiverUserName;
  final String? content;
  final int state;
  final Iterable<MessageImageState> images;

  const MessageState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isEdited,
    required this.senderUserName,
    required this.receiverUserName,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.state,
    required this.images,
  });

  MessageState markAsReceived()
    => MessageState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isEdited: isEdited,
        senderUserName: senderUserName,
        receiverUserName: receiverUserName,
        senderId: senderId,
        receiverId: receiverId,
        content: content,
        state: state != MessageStatus.viewed ? MessageStatus.received : state,
        images: images,
      );
  MessageState markAsViewed()
    => MessageState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isEdited: isEdited,
        senderUserName: senderUserName,
        receiverUserName: receiverUserName,
        senderId: senderId,
        receiverId: receiverId,
        content: content,
        state: MessageStatus.viewed,
        images: images,
      );
  MessageState startLoadingMessageImage(int messageImageId)
    => MessageState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isEdited: isEdited,
        senderUserName: senderUserName,
        receiverUserName: receiverUserName,
        senderId: senderId,
        receiverId: receiverId,
        content: content,
        state: state,
        images: images.map((e){
          if(e.id == messageImageId) return e.startLoading();
          return e;
        }),
      );
  MessageState loadMessageImage(int messageImageId,Uint8List image)
    => MessageState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isEdited: isEdited,
        senderUserName: senderUserName,
        receiverUserName: receiverUserName,
        senderId: senderId,
        receiverId: receiverId,
        content: content,
        state: state,
        images: images.map((e){
          if(e.id == messageImageId) return e.load(image);
          return e;
        }),
      );
}