import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/conversations_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void nextConversationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextConversationsAction){
    final pagination = store.state.conversations;
    MessageHub()
      .getConversations(pagination.next)
      .then(
        (messages){
          store.dispatch(NextConversationsSuccessAction(messageIds: messages.map((e) => e.id)));
          store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
        }
      )
      .catchError((e){
        store.dispatch(const NextConversationsFailedAction());
        throw e;
      });
  }
  next(action);
}
