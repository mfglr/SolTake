import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_message_state.dart';
import 'package:my_social_app/state/app_state/upload_entity_state/upload_status.dart';
import 'package:my_social_app/state/app_state/user_message_state/actions.dart';
import 'package:redux/redux.dart';

void createMessageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateMessageAction){
    MessageHub()
      .createMessage(action.receiverId, action.content)
      .then((message){
        store.dispatch(AddMessageAction(message: message.toMessageState()));
        store.dispatch(AddUserMessageAction(userId: message.receiverId, messageId: message.id));
      });
  }
  next(action);
}

void createMessageWithMediasMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateMessageWithMediasAction){
    store.dispatch(ChangeUploadStateAction(state: UploadMessageState.init(action)));
    MessageService()
      .createMessage(
        action.receiverId,
        action.content,
        action.medias,
        (rate) => store.dispatch(ChangeUploadRateAction(rate: rate, id: action.id))
      )
      .then((message){
        store.dispatch(AddMessageAction(message: message.toMessageState()));
        store.dispatch(AddUserMessageAction(userId: action.receiverId,messageId: message.id));
        store.dispatch(RemoveUploadStateAction(id: action.id));
      })
      .catchError((e){
        store.dispatch(ChangeUploadStatusAction(status: UploadStatus.failed, id: action.id));
        throw e;
      });
  }
  next(action);
}

void loadMessageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadMessageAction){
    if(store.state.messageEntityState.getValue(action.messageId) == null){
      MessageHub()
        .getMessageById(action.messageId)
        .then((message) => store.dispatch(AddMessageAction(message: message.toMessageState())));
    }
  }
  next(action);
}

void removeMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveMessagesAction && action.messageIds.isNotEmpty){
    MessageHub()
      .removeMessages(action.messageIds, action.everyone)
      .then((_){
        store.dispatch(RemoveMessagesSuccessAction(messageIds: action.messageIds));
        store.dispatch(RemoveUserMessagesAction(userId: action.userId, messageIds: action.messageIds));
      });
  }
  next(action);
}

void removeMessagesByUserIdsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveMessagesByUserIdsAction){
    MessageHub()
      .removeMessagesByUserIds(action.userIds)
      .then((_){
        for(var userId in action.userIds){
          var messageIds = store.state.messageEntityState
            .select((e) => e.senderId == userId || e.receiverId == userId)
            .map((e) => e.id);
          store.dispatch(RemoveUserMessagesAction(userId: userId, messageIds: messageIds));
        }
        store.dispatch(RemoveMessagesByUserIdsSuccessAction(userIds: action.userIds));
      });
  }
  next(action);
}

void getUnviewedMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetUnviewedMessagesAction){
    MessageHub()
      .getUnviewedMessages()
      .then((messages){
        store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
        store.dispatch(MarkMessagesAsReceivedAction(messageIds: messages.map((e) => e.id)));
      });
  }
  next(action);
}

void markMessagesAsReceivedMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is MarkMessagesAsReceivedAction){
    MessageHub()
      .markMessagesAsReceived(action.messageIds)
      .then((_) => store.dispatch(MarkMessagesAsReceivedSuccessAction(messageIds: action.messageIds)));
  }
  next(action);
}

void markMessagesAsViewedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkMessagesAsViewedAction){
    MessageHub()
      .markMessagesAsViewed(action.messageIds)
      .then((_) => store.dispatch(MarkMessagesAsViewedSuccessAction(messageIds: action.messageIds))); 
  }
  next(action);
}