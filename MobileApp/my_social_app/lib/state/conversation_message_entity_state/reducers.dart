import 'package:my_social_app/state/conversation_message_entity_state/actions.dart';
import 'package:my_social_app/state/conversation_message_entity_state/conversation_message_entity_state.dart';
import 'package:redux/redux.dart';

ConversationMessageEntityState nextPageConversationMessagesReducer(ConversationMessageEntityState prev,NextPageConversationMessagesSuccessAction action)
  => prev.nextPage(action.conversationId, action.messages);


Reducer<ConversationMessageEntityState> conversationMessageEntityReducer = combineReducers<ConversationMessageEntityState>([
  TypedReducer<ConversationMessageEntityState,NextPageConversationMessagesSuccessAction>(nextPageConversationMessagesReducer).call
]);