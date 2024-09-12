import 'package:collection/collection.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';

class MessageEntityState extends EntityState<MessageState>{
  const MessageEntityState({required super.entities});

  MessageEntityState addMessage(MessageState message)
    => MessageEntityState(entities: appendOne(message));
  MessageEntityState addMessages(Iterable<MessageState> messages)
    => MessageEntityState(entities: appendMany(messages));
  MessageEntityState addLists(Iterable<Iterable<MessageState>> lists)
    => MessageEntityState(entities: appendLists(lists));
  MessageEntityState removeMessage(int messageId)
    => MessageEntityState(entities: removeOne(messageId));
  MessageEntityState removeMessages(Iterable<int> messageIds)
    => MessageEntityState(entities: removeMany(messageIds));

  MessageEntityState markComingMessagesAsReceived(Iterable<int> messageIds)
    => MessageEntityState(entities: updateMany(messageIds.map((e) => entities[e]!.markAsReceived())));
  MessageEntityState markComingMessagesAsViewed(Iterable<int> messageIds)
    => MessageEntityState(entities: updateMany(messageIds.map((e) => entities[e]!.markAsViewed())));

  MessageEntityState markOutgoingMessageAsReceived(MessageState message){
    if(entities[message.id] == null || entities[message.id]!.state ==  MessageStatus.created){
      return MessageEntityState(entities: updateOne(message));
    }
    return this;
  }
  MessageEntityState markOutgoingMessageAsViewed(MessageState message)
    => MessageEntityState(entities: updateOne(message));

  Iterable<MessageState> selectUnviewedMessagesOfUser(int userId)
    => entities.values.where((e) => e.senderId == userId && e.state != MessageStatus.viewed);
  int selectNumberOfUnviewedMessagesOfUser(int userId)
    => selectUnviewedMessagesOfUser(userId).length;
  Iterable<int> selectIdsOfUnviewedMessagesOfUser(int userId)
    => selectUnviewedMessagesOfUser(userId).map((e) => e.id);
  Iterable<MessageState> get selectConversations{
    return groupBy(entities.values,(x) => x.conversationId)
      .values
      .map((list) => list.sorted((x,y) => x.id.compareTo(y.id)).last)
      .sorted((x,y) => y.id.compareTo(x.id));
  }
}