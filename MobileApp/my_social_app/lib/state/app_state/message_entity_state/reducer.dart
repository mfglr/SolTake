import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_entity_state.dart';
import 'package:redux/redux.dart';

MessageEntityState addMessageReducer(MessageEntityState prev,AddMessageAction action)
  => prev.addMessage(action.message);
MessageEntityState addMessagesReducer(MessageEntityState prev,AddMessagesAction action)
  => prev.addMessages(action.messages);
MessageEntityState addMessagesListsReducer(MessageEntityState prev,AddMessagesListsAction action)
  => prev.addLists(action.lists);

MessageEntityState markComingMessagesAsReceivedSuccessAction(MessageEntityState prev,MarkComingMessagesAsReceivedSuccessAction action)
  => prev.markComingMessagesAsReceived(action.messageIds);
MessageEntityState markComingMessagesAsViewedSuccessAction(MessageEntityState prev,MarkComingMessagesAsViewedSuccessAction action)
  => prev.markComingMessagesAsViewed(action.messageIds);

MessageEntityState markOutgoingMessageAsReceivedReducer(MessageEntityState prev,MarkOutgoingMessageAsReceivedAction action)
  => prev.markOutgoingMessageAsReceived(action.message);
MessageEntityState markOutgoingMessageAsViewedReducer(MessageEntityState prev,MarkOutgoingMessageAsViewedAction action)
  => prev.markOutgoingMessageAsViewed(action.message);

MessageEntityState startLoadingMessageImage(MessageEntityState prev,LoadMessageImageAction action)
  => prev.startloadingMessageImage(action.messageId, action.index);
MessageEntityState loadMessageImage(MessageEntityState prev,LoadMessageImageSuccessAction action)
  => prev.loadMessageImage(action.messageId,action.index,action.image);

Reducer<MessageEntityState> messageEntityStateReducers = combineReducers<MessageEntityState>([
  TypedReducer<MessageEntityState,AddMessageAction>(addMessageReducer).call,
  TypedReducer<MessageEntityState,AddMessagesAction>(addMessagesReducer).call,
  TypedReducer<MessageEntityState,AddMessagesListsAction>(addMessagesListsReducer).call,
  
  TypedReducer<MessageEntityState,MarkComingMessagesAsReceivedSuccessAction>(markComingMessagesAsReceivedSuccessAction).call,
  TypedReducer<MessageEntityState,MarkComingMessagesAsViewedSuccessAction>(markComingMessagesAsViewedSuccessAction).call,
  
  TypedReducer<MessageEntityState,MarkOutgoingMessageAsReceivedAction>(markOutgoingMessageAsReceivedReducer).call,
  TypedReducer<MessageEntityState,MarkOutgoingMessageAsViewedAction>(markOutgoingMessageAsViewedReducer).call,

  TypedReducer<MessageEntityState,LoadMessageImageAction>(startLoadingMessageImage).call,
  TypedReducer<MessageEntityState,LoadMessageImageSuccessAction>(loadMessageImage).call,
]);