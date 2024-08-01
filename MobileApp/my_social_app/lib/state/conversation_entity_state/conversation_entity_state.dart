import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';
import 'package:my_social_app/state/entity_state.dart';

class ConversationEntityState extends EntityState<ConversationState>{
  final bool isLast;
  final DateTime? lastDate;
  final bool isSynchronized;

  const ConversationEntityState({
    required super.entities,
    required this.isLast,
    required this.lastDate,
    required this.isSynchronized
  });

  ConversationEntityState nextPageConversations(Iterable<ConversationState> conversations)
    => ConversationEntityState(
      entities: appendMany(conversations),
      isLast: conversations.length < conversationsPerPage,
      lastDate: conversations.isNotEmpty ? conversations.last.lastMessageCreatedAt : lastDate,
      isSynchronized: isSynchronized
    );

  ConversationEntityState receiveMessage(int conversationId, int messageId,DateTime date)
    => ConversationEntityState(
        entities: prependOneAndRemovePrev(entities[conversationId]!.reveiveMessage(messageId, date)),
        isLast: isLast,
        lastDate: lastDate,
        isSynchronized: isSynchronized
      );
  
  ConversationEntityState nextPageConversationMessages(int conversationId, Iterable<int> ids)
    => ConversationEntityState(
        entities: updateOne(entities[conversationId]!.nextPageMessages(ids)),
        isLast: isLast,
        lastDate: lastDate,
        isSynchronized: isSynchronized
      );
}