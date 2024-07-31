import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';

class MessageEntityState extends EntityState<MessageState>{
  const MessageEntityState({required super.entities});

  MessageEntityState addMessage(MessageState message)
    => MessageEntityState(entities: appendOne(message));
}