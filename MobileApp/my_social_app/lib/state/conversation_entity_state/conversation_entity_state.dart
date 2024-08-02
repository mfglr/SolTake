import 'package:my_social_app/state/conversation_entity_state/conversation_state.dart';
import 'package:my_social_app/state/entity_state.dart';

class ConversationEntityState extends EntityState<ConversationState>{
  final bool isLast;
  final DateTime? lastDate;

  const ConversationEntityState({
    required super.entities,
    required this.isLast,
    required this.lastDate,
  });

  ConversationEntityState addConversations(Iterable<ConversationState> conversations)
    => ConversationEntityState(
        entities: appendMany(conversations),
        isLast: isLast,
        lastDate: lastDate
      );


  ConversationEntityState receiveMessage(int conversationId, int messageId)
    => ConversationEntityState(
        entities: prependOneAndRemovePrev(entities[conversationId]!.reveiveMessage(messageId)),
        isLast: isLast,
        lastDate: lastDate,
      );
  
  ConversationEntityState nextPageConversationMessages(int conversationId, Iterable<int> ids)
    => ConversationEntityState(
        entities: updateOne(entities[conversationId]!.nextPageMessages(ids)),
        isLast: isLast,
        lastDate: lastDate,
      );
 
  //
  ConversationState? selectByUserId(int userId) => entities.values.where((e) => e.userId == userId).firstOrNull;
}