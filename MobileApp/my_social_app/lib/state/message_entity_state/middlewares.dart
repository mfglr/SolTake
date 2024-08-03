import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void addReceiverToMessagesReceivedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is AddReceiverToMessagesReceivedAction){
    final messageIds = store.state.selectIdsOfCreatedMessagesExceptCurrentUser;
    MessageHub()
      .addReceiverToMessages(messageIds)
      .then(
        (_) => store.dispatch(
          AddReceiverToMessagesSuccessAction(
            messageIds: messageIds,
            receiverId: store.state.accountState!.id
          )
        )
      );
  }
  next(action);
}

void addViewerToMessagesReceivedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is AddViewerToMessagesReceivedAction){
    final messageIds = store.state.messageEntityState.selectIdsOfUnviewedMessagesOfUser(action.userId);
    MessageHub()
      .addViewerToMessages(messageIds)
      .then(
        (_) => store.dispatch(
          AddViewerToMessagesSuccessAction(
            messageIds: messageIds,
            viewerId: store.state.accountState!.id
          )
        )
      );
  }
  next(action);
}