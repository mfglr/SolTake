import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void getNextPageConversationsIfNoPageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageConversationsIfNoPageAction){
    final pagination = store.state.messageHomePageState.conversations;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(const GetNextPageConversationsAction());
    }
  }
  next(action);
}
void getNextPageConversationsIfReadyActionMiddleware(Store<AppState> store,action,NextDispatcher next){
   if(action is GetNextPageConversationsIfNoReadyAction){
    final pagination = store.state.messageHomePageState.conversations;
    if(pagination.isReadyForNextPage){
      store.dispatch(const GetNextPageConversationsAction());
    }
  }
  next(action);
}
void getNextPageConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageConversationsAction){
    final pagination = store.state.messageHomePageState.conversations;
    MessageService()
      .getConversations(pagination.next)
      .then(
        (messages){
          store.dispatch(AddNextPageConversationsAction(messageIds: messages.map((e) => e.id)));
          store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
          store.dispatch(AddUserImagesAction(images: messages.map((e) => UserImageState.init(e.conversationId))));
        }
      );
  }
  next(action);
}
