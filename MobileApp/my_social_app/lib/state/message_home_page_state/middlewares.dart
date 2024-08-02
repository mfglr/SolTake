import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/conversations_service.dart';
import 'package:my_social_app/state/conversation_entity_state/action.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void nextPageConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageConversationsAction){
    final state = store.state.messageHomePageState;
    if(!state.isLast){
      print(state.lastValue);
      ConversationsService()
        .getConversations(state.lastValue, conversationsPerPage, messagesPerPage)
        .then(
          (conversations){
            store.dispatch(NextPageConversationsSuccessAction(conversations: conversations));
            store.dispatch(AddConversationsAction(conversations: conversations.map((e) => e.toConversationState())));
            store.dispatch(
              AddMessagesListsAction(
                lists: conversations.map((e) => e.messages.map((e) => e.toMessageState()))
              )
            );
            store.dispatch(
              AddUserImagesAction(
                images: conversations.map((e) => UserImageState(
                  id: e.userId,
                  image: null, 
                  state: ImageState.notStarted
                ))
              )
            );
          }
        );
    }
  }
  next(action);
}
void nextPageConversationsIfNoConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageConversationsIfNoConversationsAction){
    if(store.state.conversationEntityState.entities.length < conversationsPerPage){
      store.dispatch(const NextPageConversationsAction());
    }
  }
  next(action);
}

void synchronizeHomePageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is SynchronizeHomePageAction){
    if(!store.state.messageHomePageState.isSynchronized){
      ConversationsService()
        .getConversationsThatHaveUnviewedMessages()
        .then((conversations){
          store.dispatch(
            SynchronizeHomePageSuccessAction(
              conversations: conversations
            )
          );
          store.dispatch(
            AddConversationsAction(
              conversations: conversations.map(
                (e) => e.toConversationStateWithoutPagination())
              )
            );
          store.dispatch(
            AddMessagesListsAction(
              lists: conversations.map((e)=>e.messages.map((e) => e.toMessageState()))
            )
          );

          store.dispatch(
              AddUserImagesAction(
                images: conversations.map((e) => UserImageState(
                  id: e.userId,
                  image: null, 
                  state: ImageState.notStarted
                ))
              )
            );
        });
    }
  }
  next(action);
}