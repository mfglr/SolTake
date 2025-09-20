import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/custom_packages/entity_state/entity_collection/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,MessageState> addMessageReducer(EntityState<int,MessageState> prev, AddMessageAction action)
  => prev.appendOne(action.message);
EntityState<int,MessageState> addMessagesReducer(EntityState<int,MessageState> prev, AddMessagesAction action)
  => prev.appendMany(action.messages);


EntityState<int,MessageState> removeMessagesReducer(EntityState<int,MessageState> prev,RemoveMessagesSuccessAction action)
  => prev.where((e) => !action.messageIds.contains(e.id));
EntityState<int,MessageState> removeMessagesByUserIdsReducer(EntityState<int,MessageState> prev,RemoveMessagesByUserIdsSuccessAction action)
  => prev.where((e) => !action.userIds.any((userId) => userId == e.senderId || userId == e.receiverId));

EntityState<int,MessageState> markMessagesAsReceivedSuccessAction(EntityState<int,MessageState> prev,MarkMessagesAsReceivedSuccessAction action)
  => prev.updateMany(prev.getList((e) => action.messageIds.any((messageId) => messageId == e.id)).map((e) => e.markAsReceived()));
EntityState<int,MessageState> markMessagesAsViewedSuccessAction(EntityState<int,MessageState> prev, MarkMessagesAsViewedSuccessAction action)
  => prev.updateMany(prev.getList((e) => action.messageIds.any((messageId) => messageId == e.id)).map((e) => e.markAsViewed()));
      
Reducer<EntityState<int,MessageState>> messageEntityStateReducers = combineReducers<EntityState<int,MessageState>>([
  TypedReducer<EntityState<int,MessageState>,AddMessageAction>(addMessageReducer).call,
  TypedReducer<EntityState<int,MessageState>,AddMessagesAction>(addMessagesReducer).call,
  TypedReducer<EntityState<int,MessageState>,RemoveMessagesSuccessAction>(removeMessagesReducer).call,
  TypedReducer<EntityState<int,MessageState>,RemoveMessagesByUserIdsSuccessAction>(removeMessagesByUserIdsReducer).call,

  TypedReducer<EntityState<int,MessageState>,MarkMessagesAsReceivedSuccessAction>(markMessagesAsReceivedSuccessAction).call,
  TypedReducer<EntityState<int,MessageState>,MarkMessagesAsViewedSuccessAction>(markMessagesAsViewedSuccessAction).call,
]);