import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/conversation_message_entity_state/conversation_message_state.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';

class ConversationMessageEntityState extends EntityState<ConversationMessageState>{
  const ConversationMessageEntityState({required super.entities});
  
  ConversationMessageEntityState nextPage(int conversationId,Iterable<MessageState> messages){
    final conversation = entities[conversationId];
    Map<int, ConversationMessageState> newEntities; 
    
    if(conversation != null){
      newEntities = updateOne(conversation.nextPage(conversationId, messages));
    }
    else{
      newEntities = appendOne(
        ConversationMessageState(
          id: conversationId,
          isLast: messages.length < messagesPerPage,
          lastId: messages.isNotEmpty ? messages.last.id : null
        )
      );
    }
    return ConversationMessageEntityState(entities: newEntities);
  }
}