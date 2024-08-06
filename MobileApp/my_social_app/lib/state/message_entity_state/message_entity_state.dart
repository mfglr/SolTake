import 'dart:typed_data';

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
  
  MessageEntityState startloadingMessageImage(int messageId,int messageImageId)
    => MessageEntityState(entities: updateOne(entities[messageId]!.startLoadingMessageImage(messageImageId)));
  MessageEntityState loadMessageImage(int messageId,int messageImageId,Uint8List image)
    => MessageEntityState(entities: updateOne(entities[messageId]!.loadMessageImage(messageImageId, image)));


  int? selectLastMessageId(int userId){
    final messages = entities.values
      .where((e) => e.receiverId == userId || e.senderId == userId)
      .sorted((x,y) => x.id.compareTo(y.id));
    return messages.isNotEmpty ? messages.last.id : null;
  }
  int selectNumberUserMessages(int userId)
    => entities.values
        .where((e) => e.receiverId == userId || e.senderId == userId)
        .length;
        
  Iterable<MessageState> selectUserMessages(int userId)
    => entities.values
      .where((e) => e.receiverId == userId || e.senderId == userId)
      .sorted((x,y) => y.id.compareTo(x.id));
  
  Iterable<MessageState> selectUnviewedMessagesOfUser(int userId)
    => entities.values.where((e) => e.senderId == userId && e.state != MessageStatus.viewed);
  int selectNumberOfUnviewedMessagesOfUser(int userId)
    => selectUnviewedMessagesOfUser(userId).length;
  Iterable<int> selectIdsOfUnviewedMessagesOfUser(int userId)
    => selectUnviewedMessagesOfUser(userId).map((e) => e.id);
  Iterable<MessageState> selectConversations(int accountId){
    return groupBy(entities.values,(x) => x.senderId == accountId ? x.receiverId : x.senderId)
      .values
      .map((list) => list.sorted((x,y) => x.id.compareTo(y.id)).last)
      .sorted((x,y) => y.id.compareTo(x.id));
  }
}