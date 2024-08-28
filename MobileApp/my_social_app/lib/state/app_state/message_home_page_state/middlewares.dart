import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/app_state/image_status.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void getComingMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetCommingMessagesAction){
    if(!store.state.messageHomePageState.isSynchronized){
      final accountId = store.state.accountState!.id;
      MessageService()
        .getNewCommingMessages()
        .then((messages){
          store.dispatch(const GetComingMessagesSuccessAction());
          store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
          store.dispatch(
            AddUserImagesAction(
              images: messages.map((e) => UserImageState(
                id: e.senderId == accountId ? e.receiverId : e.senderId,
                image: null,
                state: ImageStatus.notStarted
              ))
            )
          );
          store.dispatch(const MarkComingMessagesAsReceivedAction());
        });
    }
  }
  next(action);
}


void nextPageConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageConversationsAction){
    final state = store.state.messageHomePageState;
    if(!state.isLastConversations){
      final lastValue = store.state.selectLastConversationId();
      final accountId = store.state.accountState!.id;
      // MessageService()
      //   .getConversations(lastValue, conversationsPerPage,true)
      //   .then(
      //     (messages){
      //       store.dispatch(NextPageConversationsSuccessAction(messages: messages));
      //       store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
      //       store.dispatch(
      //         AddUserImagesAction(
      //           images: messages.map((e) => UserImageState(
      //             id: e.senderId == accountId ? e.receiverId : e.senderId,
      //             image: null,
      //             state: ImageStatus.notStarted
      //           ))
      //         )
      //       );
      //     }
      //   );
    }
  }
  next(action);
}
void nextPageConversationsIfNoConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageConversationsIfNoConversationsAction){
    final numberOfConversation = store.state.selectNumberOfConversation();
    if(numberOfConversation < conversationsPerPage){
      store.dispatch(const NextPageConversationsAction());
    }
  }
  next(action);
}

