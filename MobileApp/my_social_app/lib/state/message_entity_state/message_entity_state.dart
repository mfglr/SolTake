import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';

class MessageEntityState extends EntityState<MessageState>{
  const MessageEntityState({required super.entities});

  MessageEntityState addMessage(MessageState message)
    => MessageEntityState(entities: appendOne(message));
  
  MessageEntityState addMessages(Iterable<MessageState> messages)
    => MessageEntityState(entities: appendMany(messages));
  
  MessageEntityState addLists(Iterable<Iterable<MessageState>> lists)
    => MessageEntityState(entities: appendLists(lists));
}