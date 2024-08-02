import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/conversations_service.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/conversation_entity_state/action.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void loadConversationByReceiverIdMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadConversationByReceiverIdAction){
    if(store.state.conversationEntityState.selectByUserId(action.receiverId) == null){
      ConversationsService()
        .getConversationByReceiverId(action.receiverId,messagesPerPage)
        .then(
          (conversation){
            if(conversation != null){
              store.dispatch(
                AddConversationAction(
                  conversation: conversation.toConversationState()
                )
              );
              store.dispatch(
                AddUserImageAction(
                  image: UserImageState(id: conversation.userId,image: null,state: ImageState.notStarted)
                )
              );
            }
          }
        );
    }
  }
  next(action);
}
void nextPageConversationMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageConversationMessagesAction){
    final messages = store.state.conversationEntityState.entities[action.conversationId]!.messages;
    if(!messages.isLast){
      MessageService()
        .getMessagesByConversationId(action.conversationId, messages.lastValue, messagesPerPage)
        .then((messages){
          store.dispatch(
            AddMessagesAction(
              messages: messages.map((e) => e.toMessageState())
            )
          );
          store.dispatch(
            NextPageConversationMessagesSuccessAction(
              conversationId: action.conversationId,
              ids: messages.map((e) => e.id)
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


