import 'package:my_social_app/state/message_entity_state/message_stataus.dart';

class MessageState{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEdited;
  final int senderId;
  final int receiverId;
  final String? content;
  final int state;
  final Iterable<int> images;

  const MessageState({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isEdited,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.state,
    required this.images
  });

  MessageState addReceiver()
    => MessageState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isEdited: isEdited,
        senderId: senderId,
        receiverId: receiverId,
        content: content,
        state: state != MessageStatus.viewed ? MessageStatus.received : state,
        images: images
      );
      
  MessageState addViewer()
    => MessageState(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isEdited: isEdited,
        senderId: senderId,
        receiverId: receiverId,
        content: content,
        state: MessageStatus.viewed,
        images: images
      );
}