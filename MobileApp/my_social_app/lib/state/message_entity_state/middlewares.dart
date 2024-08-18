import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void markComingMessageAsReceivedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkComingMessageAsReceivedAction){
    final messageIds = [action.messageId];
    MessageHub()
      .markMessagesAsReceived(messageIds)
      .then((_) =>store.dispatch(MarkComingMessagesAsReceivedSuccessAction(messageIds: messageIds)));
  }
  next(action);
}
void markComingMessageAsViewedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkComingMessageAsViewedAction){
    final messageIds = [action.messageId];
    MessageHub()
      .markMessagesAsViewed(messageIds)
      .then((_) => store.dispatch(MarkComingMessagesAsViewedSuccessAction(messageIds: messageIds)));
  }
  next(action);
}
void markComingMessagesAsReceivedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkComingMessagesAsReceivedAction){
    final messageIds = store.state.selectIdsOfNewComingMessages;
    if(messageIds.isNotEmpty){
      MessageHub()
        .markMessagesAsReceived(messageIds)
        .then((_) => store.dispatch(MarkComingMessagesAsReceivedSuccessAction(messageIds: messageIds)));
    }
  }
  next(action);
}
void markComingMessagesAsViewedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkComingMessagesAsViewedAction){
    final messageIds = store.state.messageEntityState.selectIdsOfUnviewedMessagesOfUser(action.userId);
    if(messageIds.isNotEmpty){
      MessageHub()
      .markMessagesAsViewed(messageIds)
      .then((_) => store.dispatch(MarkComingMessagesAsViewedSuccessAction(messageIds: messageIds)));
    }    
  }
  next(action);
}

void loadMessageImageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadMessageImageAction){
    final image = store.state.messageEntityState.entities[action.messageId]!.images.where((e) => e.id == action.messageImageId).first;
    if(image.status == ImageStatus.notStarted){
      MessageService()
        .getMessageImage(action.messageId, action.messageImageId)
        .then(
          (image) => store.dispatch(
            LoadMessageImageSuccessAction(
              messageId: action.messageId,
              messageImageId: action.messageImageId,
              image: image
            )
          )
        );
    }
  }
  next(action);
}