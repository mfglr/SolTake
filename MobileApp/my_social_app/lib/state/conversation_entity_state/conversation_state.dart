import 'package:my_social_app/state/ids.dart';

class ConversationState{
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;
  final String userName;
  final String? name;
  final Ids messages;

  const ConversationState({
    required this.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.messages
  });

  ConversationState reveiveMessage(int messageId)
    => ConversationState(
        id: id,
        userId: userId,
        name: name,
        userName: userName,
        createdAt: createdAt,
        updatedAt: updatedAt,
        messages: messages.prependOne(messageId)
      );

  ConversationState appendMessages(Iterable<int> ids)
    => ConversationState(
        id: id,
        userId: userId,
        name: name,
        userName: userName,
        createdAt: createdAt,
        updatedAt: updatedAt,
        messages: messages.appendMany(ids)
      );
  
  ConversationState nextPageMessages(Iterable<int> ids)
    => ConversationState(
        id: id,
        userId: userId,
        name: name,
        userName: userName,
        createdAt: createdAt,
        updatedAt: updatedAt,
        messages: messages.nextPage(ids)
      );
}