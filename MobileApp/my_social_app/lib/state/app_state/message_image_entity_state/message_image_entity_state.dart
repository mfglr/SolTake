import 'dart:typed_data';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';

class MessageImageEntityState extends EntityState<MessageImageState>{
  const MessageImageEntityState({required super.entities});

 MessageImageEntityState addMessageImage(MessageImageState image)
    => MessageImageEntityState(entities: appendOne(image));
  MessageImageEntityState addMessageImages(Iterable<MessageImageState> images)
    => MessageImageEntityState(entities: appendMany(images));
  MessageImageEntityState addMessageImagesList(Iterable<Iterable<MessageImageState>> lists)
    => MessageImageEntityState(entities: appendLists(lists));
  MessageImageEntityState startLoading(int messageId,int index)
    => MessageImageEntityState(entities: updateOne(entities[MessageImageState.generateId(messageId, index)]?.startLoading()));
  MessageImageEntityState load(int messageId,int index,Uint8List image)
    => MessageImageEntityState(entities: updateOne(entities[MessageImageState.generateId(messageId, index)]?.load(image)));

  Iterable<MessageImageState> selectMessageImages(int messageId) => entities.values.where((e) => e.messageId == messageId);
}