import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:redux/redux.dart';

EntityState<int,MessageState> addMessageReducer(EntityState<int,MessageState> prev,AddMessageAction action)
  => prev.appendOne(action.message);
EntityState<int,MessageState> addMessagesReducer(EntityState<int,MessageState> prev,AddMessagesAction action)
  => prev.appendMany(action.messages);
EntityState<int,MessageState> addMessagesListsReducer(EntityState<int,MessageState> prev,AddMessagesListsAction action)
  => prev.appendList(action.lists);
EntityState<int,MessageState> removeMessageReducer(EntityState<int,MessageState> prev,RemoveMessageSuccessAction action)
  => prev.where((e) => e.id != action.messageId);
EntityState<int,MessageState> removeMessagesReducer(EntityState<int,MessageState> prev,RemoveMessagesSuccessAction action)
  => prev.where((e) => !action.messageIds.contains(e.id));
EntityState<int,MessageState> removeMessagesByUserIdsReducer(EntityState<int,MessageState> prev,RemoveMessagesByUserIdsSuccessAction action)
  => prev.where((e) => !action.userIds.any((userId) => userId == e.senderId || userId == e.receiverId));

EntityState<int,MessageState> markComingMessagesAsReceivedSuccessAction(EntityState<int,MessageState> prev,MarkComingMessagesAsReceivedSuccessAction action)
  => prev.updateMany(prev.getList((e) => action.messageIds.any((messageId) => messageId == e.id)).map((e) => e.markAsReceived()));
EntityState<int,MessageState> markComingMessagesAsViewedSuccessAction(EntityState<int,MessageState> prev,MarkComingMessagesAsViewedSuccessAction action)
  => prev.updateMany(prev.getList((e) => action.messageIds.any((messageId) => messageId == e.id)).map((e) => e.markAsViewed()));

EntityState<int,MessageState> markOutgoingMessageAsReceivedReducer(EntityState<int,MessageState> prev,MarkOutgoingMessageAsReceivedAction action)
  // => prev.markOutgoingMessageAsReceived(action.message);
  => prev;
EntityState<int,MessageState> markOutgoingMessageAsViewedReducer(EntityState<int,MessageState> prev,MarkOutgoingMessageAsViewedAction action)
  // => prev.markOutgoingMessageAsViewed(action.message);
  => prev;
Reducer<EntityState<int,MessageState>> messageEntityStateReducers = combineReducers<EntityState<int,MessageState>>([
  TypedReducer<EntityState<int,MessageState>,AddMessageAction>(addMessageReducer).call,
  TypedReducer<EntityState<int,MessageState>,AddMessagesAction>(addMessagesReducer).call,
  TypedReducer<EntityState<int,MessageState>,AddMessagesListsAction>(addMessagesListsReducer).call,
  TypedReducer<EntityState<int,MessageState>,RemoveMessageSuccessAction>(removeMessageReducer).call,
  TypedReducer<EntityState<int,MessageState>,RemoveMessagesSuccessAction>(removeMessagesReducer).call,
  TypedReducer<EntityState<int,MessageState>,RemoveMessagesByUserIdsSuccessAction>(removeMessagesByUserIdsReducer).call,

  TypedReducer<EntityState<int,MessageState>,MarkComingMessagesAsReceivedSuccessAction>(markComingMessagesAsReceivedSuccessAction).call,
  TypedReducer<EntityState<int,MessageState>,MarkComingMessagesAsViewedSuccessAction>(markComingMessagesAsViewedSuccessAction).call,
  
  TypedReducer<EntityState<int,MessageState>,MarkOutgoingMessageAsReceivedAction>(markOutgoingMessageAsReceivedReducer).call,
  TypedReducer<EntityState<int,MessageState>,MarkOutgoingMessageAsViewedAction>(markOutgoingMessageAsViewedReducer).call,
]);