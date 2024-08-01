import 'package:my_social_app/state/conversation_entity_state/action.dart';
import 'package:my_social_app/state/conversation_entity_state/conversation_entity_state.dart';
import 'package:redux/redux.dart';

ConversationEntityState addConversationMessageReducer(ConversationEntityState prev,AddConversateMessageAction action)
  => prev.receiveMessage(action.conversationId,action.messageId,action.date);
ConversationEntityState nextPageConversationsSuccessReducer(ConversationEntityState prev,NextPageConversationsSuccessAction action)
  => prev.nextPageConversations(action.conversations);

Reducer<ConversationEntityState> conversationEntityStateReducers = combineReducers<ConversationEntityState>([
  TypedReducer<ConversationEntityState,AddConversateMessageAction>(addConversationMessageReducer).call,
  TypedReducer<ConversationEntityState,NextPageConversationsSuccessAction>(nextPageConversationsSuccessReducer).call,
]);