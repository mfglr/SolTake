import 'package:my_social_app/state/conversation_entity_state/action.dart';
import 'package:my_social_app/state/conversation_entity_state/conversation_entity_state.dart';
import 'package:redux/redux.dart';

ConversationEntityState appendConversationsReducer(ConversationEntityState prev,AddConversationsAction action)
  => prev.addConversations(action.conversations);
ConversationEntityState addConversationMessageReducer(ConversationEntityState prev,AddConversationMessageAction action)
  => prev.receiveMessage(action.conversationId,action.messageId);
ConversationEntityState nextPageConversationMessagesSuccessReducer(ConversationEntityState prev,NextPageConversationMessagesSuccessAction action)
  => prev.nextPageConversationMessages(action.conversationId, action.ids);

Reducer<ConversationEntityState> conversationEntityStateReducers = combineReducers<ConversationEntityState>([
  TypedReducer<ConversationEntityState,AddConversationsAction>(appendConversationsReducer).call,
  TypedReducer<ConversationEntityState,AddConversationMessageAction>(addConversationMessageReducer).call,
]);