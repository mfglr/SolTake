import 'package:collection/collection.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';

class MessageEntityState extends EntityState<MessageState>{
  const MessageEntityState({required super.entities});

  MessageEntityState addMessage(MessageState message)
    => MessageEntityState(entities: appendOne(message));
  MessageEntityState addMessages(Iterable<MessageState> messages)
    => MessageEntityState(entities: appendMany(messages));
  MessageEntityState addLists(Iterable<Iterable<MessageState>> lists)
    => MessageEntityState(entities: appendLists(lists));

  MessageEntityState addReceiverToMessages(Iterable<int> messageIds, int receiverId)
    => MessageEntityState(entities: updateMany(messageIds.map((e) => entities[e]!.addReceiver())));
  MessageEntityState addViewerToMessages(Iterable<int> messageIds, int receiverId)
    => MessageEntityState(entities: updateMany(messageIds.map((e) => entities[e]!.addViewer())));


  int selectLastMessageId(int userId)
    => entities.values
      .where((e) => e.receiverId == userId || e.senderId == userId)
      .sorted((x,y) => x.id.compareTo(y.id)).last.id;
  int selectNumberUserMessages(int userId)
    => entities.values
        .where((e) => e.receiverId == userId || e.senderId == userId)
        .length;
  
  Iterable<MessageState> selectUserMessages(int userId)
    => entities.values
      .where((e) => e.receiverId == userId || e.senderId == userId)
      .sorted((x,y) => x.id.compareTo(y.id));
  
  int getNumberOfUnviewedMessagesOfUser(int userId)
    => entities.values.where((x) => x.senderId == userId && x.state != MessageStatus.viewed).length;

  Iterable<int> selectIdsOfUnviewedMessagesOfUser(int userId)
    => entities.values
        .where((e) => e.senderId == userId && e.state != MessageStatus.viewed)
        .map((e) => e.id);

}