import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

@immutable
class CreateMessageState{
  final String? content;
  final Iterable<XFile> images;
  final int? receiverId;
  
  const CreateMessageState({
    required this.content,
    required this.images,
    required this.receiverId
  });

  CreateMessageState changeContent(String content)
    => CreateMessageState(
        content: content,
        images: images,
        receiverId: receiverId
      );
  
  CreateMessageState changeReceiverId(int receiverId)
    => CreateMessageState(
        content: null,
        images: const [],
        receiverId: receiverId
      );
  
  CreateMessageState addImage(XFile image)
    => CreateMessageState(
        content: content,
        images: images.followedBy([image]),
        receiverId: receiverId
      );
  
  CreateMessageState removeImage(XFile image)
    => CreateMessageState(
        content: content,
        images: images.where((e) => e == image),
        receiverId: receiverId
      );
}