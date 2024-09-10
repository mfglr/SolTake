import 'dart:typed_data';

import 'package:my_social_app/state/app_state/image_status.dart';

class MessageImageState{
  final int messageId;
  final int index;
  final Uint8List? image;
  final ImageStatus status;

  static String generateId(int messageId,int index) => "${messageId.toString()}-${index.toString()}";
  String get id => generateId(messageId,index);
  
  MessageImageState({
    required this.messageId,
    required this.index,
    required this.image,
    required this.status
  });

  factory MessageImageState.init(int messageId,int index)
    => MessageImageState(
        messageId: messageId,
        index: index,
        image: null,
        status: ImageStatus.notStarted
      );

  MessageImageState startLoading(){
    if(status != ImageStatus.notStarted) return this;
    return MessageImageState(
      messageId: messageId,
      index: index,
      image: image,
      status: ImageStatus.started
    );
  }

  MessageImageState load(Uint8List image)
    => MessageImageState(
        messageId: messageId,
        index: index,
        image: image,
        status: ImageStatus.done
      );
}