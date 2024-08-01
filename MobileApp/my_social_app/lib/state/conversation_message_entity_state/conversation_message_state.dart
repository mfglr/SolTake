import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';

class ConversationMessageState{
  final int id;
  final bool isLast;
  final int? lastId;
  
  const ConversationMessageState({required this.id, required this.isLast, required this.lastId});

  ConversationMessageState nextPage(int conversationId,Iterable<MessageState> messages)
    => ConversationMessageState(
        id: id,
        isLast: messages.length < messagesPerPage,
        lastId: messages.isNotEmpty ? messages.last.id : lastId
      );
}