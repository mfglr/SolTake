import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void nextConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextConversationsAction){
    final pagination = store.state.messageHomePageState.conversations;
    MessageService()
      .getConversations(pagination.next)
      .then(
        (messages){
          store.dispatch(NextConversationsSuccessAction(messageIds: messages.map((e) => e.id)));
          store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
          store.dispatch(AddUserImagesAction(images: messages.map((e) => UserImageState.init(e.conversationId))));
        }
      )
      .catchError((e){
        store.dispatch(const NextConversationsFailedAction());
        throw e;
      });
  }
  next(action);
}
