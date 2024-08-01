import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/conversation_message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void nextPageConversationMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageConversationMessagesAction){
    final messages = store.state.conversationEntityState.entities[action.conversationId]!.messages;
    if(!messages.isLast){
      MessageService()
        .getMessagesByConversationId(action.conversationId, messages.lastId, messagesPerPage)
        .then((messages){
          final messageStates = messages.map((e) => e.toMessageState());
          
          store.dispatch(
            AddMessagesAction(
              messages: messageStates
            )
          );

          store.dispatch(
            NextPageConversationMessagesSuccessAction(
              conversationId: action.conversationId,
              messages: messageStates
            )
          );
        });
    }
  }
  next(action);
}
void nextPageConversationMessagesIfNoMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageConversationMessagesIfNoMessagesAction){
    if(store.state.conversationEntityState.entities[action.conversationId]!.messages.ids.length < messagesPerPage){
      store.dispatch(NextPageConversationMessagesAction(conversationId: action.conversationId));
    }
  }
  next(action);
}