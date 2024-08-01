import 'package:my_social_app/state/ids.dart';

class ConversationState{
  final int id;
  final int userId;
  final String userName;
  final String? name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime lastMessageCreatedAt;
  final Ids messages;

  const ConversationState({
    required this.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessageCreatedAt,
    required this.messages
  });

  ConversationState reveiveMessage(int id, DateTime date)
    => ConversationState(
        id: id,
        userId: userId,
        name: name,
        userName: userName,
        createdAt: createdAt,
        updatedAt: updatedAt,
        lastMessageCreatedAt: date,
        messages: messages.prependOne(id)
      );

  ConversationState appendMessages(Iterable<int> ids)
    => ConversationState(
        id: id,
        userId: userId,
        name: name,
        userName: userName,
        createdAt: createdAt,
        updatedAt: updatedAt,
        lastMessageCreatedAt: lastMessageCreatedAt,
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
        lastMessageCreatedAt: lastMessageCreatedAt,
        messages: messages.nextPage(ids)
      );
}