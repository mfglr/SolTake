import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';

class MessageEntityState extends EntityState<MessageState>{
  const MessageEntityState({required super.containers});

  MessageEntityState addMessage(MessageState message)
    => MessageEntityState(containers: appendOne(message));
  MessageEntityState addMessages(Iterable<MessageState> messages)
    => MessageEntityState(containers: appendMany(messages));
  MessageEntityState addLists(Iterable<Iterable<MessageState>> lists)
    => MessageEntityState(containers: appendLists(lists));

  MessageEntityState markComingMessagesAsReceived(Iterable<int> messageIds)
    => MessageEntityState(containers: updateMany(messageIds.map((e) => containers[e]!.entity.markAsReceived())));
  MessageEntityState markComingMessagesAsViewed(Iterable<int> messageIds)
    => MessageEntityState(containers: updateMany(messageIds.map((e) => containers[e]!.entity.markAsViewed())));

  MessageEntityState markOutgoingMessageAsReceived(MessageState message){
    if(containers[message.id] == null || containers[message.id]!.entity.state == MessageStatus.created){
      return MessageEntityState(containers: updateOne(message));
    }
    return this;
  }
  MessageEntityState markOutgoingMessageAsViewed(MessageState message)
    => MessageEntityState(containers: updateOne(message));
  
  MessageEntityState startloadingMessageImage(int messageId,int messageImageId)
    => MessageEntityState(containers: updateOne(containers[messageId]!.entity.startLoadingMessageImage(messageImageId)));
  MessageEntityState loadMessageImage(int messageId,int messageImageId,Uint8List image)
    => MessageEntityState(containers: updateOne(containers[messageId]!.entity.loadMessageImage(messageImageId, image)));

  Iterable<MessageState> selectUnviewedMessagesOfUser(int userId)
    => containers.values
        .where((e) => e.entity.senderId == userId && e.entity.state != MessageStatus.viewed)
        .map((e) => e.entity);
  int selectNumberOfUnviewedMessagesOfUser(int userId)
    => selectUnviewedMessagesOfUser(userId).length;
  Iterable<int> selectIdsOfUnviewedMessagesOfUser(int userId)
    => selectUnviewedMessagesOfUser(userId).map((e) => e.id);
  Iterable<MessageState> selectConversations(int accountId){
    return groupBy(containers.values,(x) => x.entity.senderId == accountId ? x.entity.receiverId : x.entity.senderId)
      .values
      .map((list) => list.sorted((x,y) => x.entity.id.compareTo(y.entity.id)).last)
      .sorted((x,y) => y.entity.id.compareTo(x.entity.id))
      .map((e) => e.entity);
  }
}