import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<num,MessageState> addMessageReducer(EntityState<num,MessageState> prev,AddMessageAction action)
  => prev.appendOne(action.message);
EntityState<num,MessageState> addMessagesReducer(EntityState<num,MessageState> prev,AddMessagesAction action)
  => prev.appendMany(action.messages);
EntityState<num,MessageState> addMessagesListsReducer(EntityState<num,MessageState> prev,AddMessagesListsAction action)
  => prev.appendList(action.lists);
EntityState<num,MessageState> removeMessageReducer(EntityState<num,MessageState> prev,RemoveMessageSuccessAction action)
  => prev.where((e) => e.id != action.messageId);
EntityState<num,MessageState> removeMessagesReducer(EntityState<num,MessageState> prev,RemoveMessagesSuccessAction action)
  => prev.where((e) => !action.messageIds.contains(e.id));
EntityState<num,MessageState> removeMessagesByUserIdsReducer(EntityState<num,MessageState> prev,RemoveMessagesByUserIdsSuccessAction action)
  => prev.where((e) => !action.userIds.any((userId) => userId == e.senderId || userId == e.receiverId));

EntityState<num,MessageState> markComingMessagesAsReceivedSuccessAction(EntityState<num,MessageState> prev,MarkComingMessagesAsReceivedSuccessAction action)
  => prev.updateMany(prev.getList((e) => action.messageIds.any((messageId) => messageId == e.id)).map((e) => e.markAsReceived()));
EntityState<num,MessageState> markComingMessagesAsViewedSuccessAction(EntityState<num,MessageState> prev,MarkComingMessagesAsViewedSuccessAction action)
  => prev.updateMany(prev.getList((e) => action.messageIds.any((messageId) => messageId == e.id)).map((e) => e.markAsViewed()));

EntityState<num,MessageState> markOutgoingMessageAsReceivedReducer(EntityState<num,MessageState> prev,MarkOutgoingMessageAsReceivedAction action)
  // => prev.markOutgoingMessageAsReceived(action.message);
  => prev;
EntityState<num,MessageState> markOutgoingMessageAsViewedReducer(EntityState<num,MessageState> prev,MarkOutgoingMessageAsViewedAction action)
  // => prev.markOutgoingMessageAsViewed(action.message);
  => prev;
Reducer<EntityState<num,MessageState>> messageEntityStateReducers = combineReducers<EntityState<num,MessageState>>([
  TypedReducer<EntityState<num,MessageState>,AddMessageAction>(addMessageReducer).call,
  TypedReducer<EntityState<num,MessageState>,AddMessagesAction>(addMessagesReducer).call,
  TypedReducer<EntityState<num,MessageState>,AddMessagesListsAction>(addMessagesListsReducer).call,
  TypedReducer<EntityState<num,MessageState>,RemoveMessageSuccessAction>(removeMessageReducer).call,
  TypedReducer<EntityState<num,MessageState>,RemoveMessagesSuccessAction>(removeMessagesReducer).call,
  TypedReducer<EntityState<num,MessageState>,RemoveMessagesByUserIdsSuccessAction>(removeMessagesByUserIdsReducer).call,

  TypedReducer<EntityState<num,MessageState>,MarkComingMessagesAsReceivedSuccessAction>(markComingMessagesAsReceivedSuccessAction).call,
  TypedReducer<EntityState<num,MessageState>,MarkComingMessagesAsViewedSuccessAction>(markComingMessagesAsViewedSuccessAction).call,
  
  TypedReducer<EntityState<num,MessageState>,MarkOutgoingMessageAsReceivedAction>(markOutgoingMessageAsReceivedReducer).call,
  TypedReducer<EntityState<num,MessageState>,MarkOutgoingMessageAsViewedAction>(markOutgoingMessageAsViewedReducer).call,
]);