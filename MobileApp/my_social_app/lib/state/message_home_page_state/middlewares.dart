import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/image_state.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_entity_state/message_stataus.dart';
import 'package:my_social_app/state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void nextPageConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageConversationsAction){
    final state = store.state.messageHomePageState;
    if(!state.isLastConversations){
      final lastValue = store.state.selectLastConversationId();
      MessageService()
        .getConversations(lastValue, conversationsPerPage)
        .then(
          (users){
            store.dispatch(NextPageConversationsSuccessAction(users: users));
            store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
            store.dispatch(
              AddUserImagesAction(
                images: users.map((e) => UserImageState(
                  id: e.id,
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
    final numberOfConversation = store.state.selectNumberOfConversation();
    if(numberOfConversation < conversationsPerPage){
      store.dispatch(const NextPageConversationsAction());
    }
  }
  next(action);
}

void getNewMessageSendersMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNewMessageSendersAction){
    if(!store.state.messageHomePageState.isSynchronized){
      MessageService()
        .getNewMessagesSenders()
        .then((users){
          store.dispatch(const GetNewMessageSendersSuccessAction());
          store.dispatch(AddMessagesListsAction(lists: users.map((e) => e.messages.map((e) => e.toMessageState()))));
          store.dispatch(AddUsersAction(users: users.map((e) => e.toUserState())));
          store.dispatch(
            AddUserImagesAction(
              images: users.map((e) => UserImageState(
                id: e.id,
                image: null, 
                state: ImageState.notStarted
              ))
            )
          );
          if(users.any((e) => e.messages.any((e) => e.state == MessageStatus.created))){
            store.dispatch(const AddReceiverToMessagesReceivedAction());
          }
        });
    }
  }
  next(action);
}