import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_stataus.dart';

@immutable
class MessageState{
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
  final int numberOfImages;
  final Iterable<MessageImageState> images;

  const MessageState({
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
    required this.numberOfImages,
    required this.images
  });

  MessageState _optinal({
    String? newUserName,
    bool? newIsEdited,
    String? newContent,
    int? newState,
    int? newNumberOfImages,
    Iterable<MessageImageState>? newImages, 
  })
    => MessageState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isOwner: isOwner,
        userName: newUserName ?? userName,
        conversationId: conversationId,
        senderId: senderId,
        receiverId: receiverId,
        isEdited: newIsEdited ?? isEdited,
        content: newContent ?? content,
        state: newState ?? state,
        numberOfImages: newNumberOfImages ?? numberOfImages,
        images: newImages ?? images
      );
  
  MessageState markAsReceived() => _optinal( newState: state != MessageStatus.viewed ? MessageStatus.received : state);
  MessageState markAsViewed() => _optinal(newState: MessageStatus.viewed);
  MessageState startLoadingMessageImage(int index)
    => _optinal(newImages: [...images.take(index + 1), images.elementAt(index).startLoading(),...images.skip(index + 1)]);
  MessageState loadMessageImage(int index,Uint8List image)
    => _optinal(newImages: [...images.take(index + 1), images.elementAt(index).load(image),...images.skip(index + 1)]);
}