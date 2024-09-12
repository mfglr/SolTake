import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_entity_state.dart';
import 'package:redux/redux.dart';

MessageEntityState addMessageReducer(MessageEntityState prev,AddMessageAction action)
  => prev.addMessage(action.message);
MessageEntityState addMessagesReducer(MessageEntityState prev,AddMessagesAction action)
  => prev.addMessages(action.messages);
MessageEntityState addMessagesListsReducer(MessageEntityState prev,AddMessagesListsAction action)
  => prev.addLists(action.lists);
MessageEntityState removeMessageReducer(MessageEntityState prev,RemoveMessageSuccessAction action)
  => prev.removeMessage(action.messageId);
MessageEntityState removeMessagesReducer(MessageEntityState prev,RemoveMessagesSuccessAction action)
  => prev.removeMessages(action.messageIds);

MessageEntityState markComingMessagesAsReceivedSuccessAction(MessageEntityState prev,MarkComingMessagesAsReceivedSuccessAction action)
  => prev.markComingMessagesAsReceived(action.messageIds);
MessageEntityState markComingMessagesAsViewedSuccessAction(MessageEntityState prev,MarkComingMessagesAsViewedSuccessAction action)
  => prev.markComingMessagesAsViewed(action.messageIds);

MessageEntityState markOutgoingMessageAsReceivedReducer(MessageEntityState prev,MarkOutgoingMessageAsReceivedAction action)
  => prev.markOutgoingMessageAsReceived(action.message);
MessageEntityState markOutgoingMessageAsViewedReducer(MessageEntityState prev,MarkOutgoingMessageAsViewedAction action)
  => prev.markOutgoingMessageAsViewed(action.message);

Reducer<MessageEntityState> messageEntityStateReducers = combineReducers<MessageEntityState>([
  TypedReducer<MessageEntityState,AddMessageAction>(addMessageReducer).call,
  TypedReducer<MessageEntityState,AddMessagesAction>(addMessagesReducer).call,
  TypedReducer<MessageEntityState,AddMessagesListsAction>(addMessagesListsReducer).call,
  TypedReducer<MessageEntityState,RemoveMessageSuccessAction>(removeMessageReducer).call,
  TypedReducer<MessageEntityState,RemoveMessagesSuccessAction>(removeMessagesReducer).call,

  TypedReducer<MessageEntityState,MarkComingMessagesAsReceivedSuccessAction>(markComingMessagesAsReceivedSuccessAction).call,
  TypedReducer<MessageEntityState,MarkComingMessagesAsViewedSuccessAction>(markComingMessagesAsViewedSuccessAction).call,
  
  TypedReducer<MessageEntityState,MarkOutgoingMessageAsReceivedAction>(markOutgoingMessageAsReceivedReducer).call,
  TypedReducer<MessageEntityState,MarkOutgoingMessageAsViewedAction>(markOutgoingMessageAsViewedReducer).call,
]);