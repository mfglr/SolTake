import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/message_entity_state.dart';
import 'package:redux/redux.dart';

MessageEntityState addMessageReducer(MessageEntityState prev,AddMessageAction action)
  => prev.addMessage(action.message);
MessageEntityState addMessagesReducer(MessageEntityState prev,AddMessagesAction action)
  => prev.addMessages(action.messages);
MessageEntityState addMessagesListsReducer(MessageEntityState prev,AddMessagesListsAction action)
  => prev.addLists(action.lists);

MessageEntityState addReceiverToMessagesSuccessReducer(MessageEntityState prev,AddReceiverToMessagesSuccessAction action)
  => prev.addReceiverToMessages(action.messageIds, action.receiverId);

MessageEntityState addViewerToMessagesSuccessReducer(MessageEntityState prev,AddViewerToMessagesSuccessAction action)
  => prev.addViewerToMessages(action.messageIds, action.viewerId);

Reducer<MessageEntityState> messageEntityStateReducers = combineReducers<MessageEntityState>([
  TypedReducer<MessageEntityState,AddMessageAction>(addMessageReducer).call,
  TypedReducer<MessageEntityState,AddMessagesAction>(addMessagesReducer).call,
  TypedReducer<MessageEntityState,AddMessagesListsAction>(addMessagesListsReducer).call,
  TypedReducer<MessageEntityState,AddReceiverToMessagesSuccessAction>(addReceiverToMessagesSuccessReducer).call,
  TypedReducer<MessageEntityState,AddViewerToMessagesSuccessAction>(addViewerToMessagesSuccessReducer).call,
]);