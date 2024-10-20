import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/services/message_service.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

// MessageState _createMessageState(int receiverId, String? content, Iterable<XFile> images,AccountState account){
//   return MessageState(
//     id: 0,
//     createdAt: DateTime.now(),
//     updatedAt: null,
//     isOwner: true,
//     userName: account.userName ,
//     conversationId: receiverId,
//     senderId: account.id,
//     receiverId: receiverId,
//     isEdited: false,
//     content: content,
//     state: MessageStatus.created,
//     numberOfImages: images.length
//   );
// }


void createMessageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateMessageAction){
    MessageHub()
      .createMessage(action.receiverId, action.content)
      .then((message){
        store.dispatch(AddMessageAction(message: message.toMessageState()));
        store.dispatch(AddUserMessageAction(userId: action.receiverId,messageId: message.id));
      });
  }
  next(action);
}

void createMessageWithImagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is CreateMessageWithImagesAction){
    MessageService()
      .createMessage(action.receiverId, action.content, action.images)
      .then((message){
        store.dispatch(AddMessageAction(message: message.toMessageState()));
        store.dispatch(AddMessageImagesAction(images: List.generate(
          message.numberOfImages, (index) => MessageImageState.init(message.id, index))
        ));
        store.dispatch(AddUserMessageAction(userId: action.receiverId,messageId: message.id));
      });
  }
  next(action);
}

void loadMessageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadMessageAction){
    if(store.state.messageEntityState.entities[action.messageId] == null){
      MessageService()
        .getMessageById(action.messageId)
        .then((message){
          store.dispatch(AddMessageAction(message: message.toMessageState()));
          store.dispatch(AddMessageImagesAction(images: List.generate(
            message.numberOfImages, (index) => MessageImageState.init(message.id, index)
          )));
          store.dispatch(AddUserImageAction(image: UserImageState.init(message.conversationId)));
        });
    }
  }
  next(action);
}

void removeMessageMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveMessageAction){
    final message = store.state.messageEntityState.entities[action.messageId];
    if(message != null){
      final conversationId = message.conversationId;
      MessageService()
        .removeMessage(action.messageId)
        .then((_){
          store.dispatch(RemoveMessageSuccessAction(messageId: action.messageId));
          store.dispatch(RemoveUserMessageAction(userId: conversationId, messageId: action.messageId));
          store.dispatch(RemoveMessageImagesAction(messageId: action.messageId));
        });
    }
  }
  next(action);
}

void removeMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveMessagesAction && action.messageIds.isNotEmpty){
    MessageService()
      .removeMessages(action.messageIds)
      .then((_){
        store.dispatch(RemoveMessagesSuccessAction(messageIds: action.messageIds));
        store.dispatch(RemoveUserMessagesAction(userId: action.userId, messageIds: action.messageIds));
        store.dispatch(RemoveMessagesImagesAction(messageIds: action.messageIds));
      });
  }
  next(action);
}

void removeMessagesByUserIdsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RemoveMessagesByUserIdsAction){
    MessageService()
      .removeMessagesByUserIds(action.userIds)
      .then((_){
        store.dispatch(RemoveMessagesByUserIdsSuccessAction(userIds: action.userIds));
        for(var userId in action.userIds){
          var messageIds = store.state.messageEntityState.selectUserMessages(userId).map((e) => e.id);
          store.dispatch(RemoveUserMessagesAction(userId: userId, messageIds: messageIds));
          store.dispatch(RemoveMessagesImagesAction(messageIds: messageIds));
        }
      });
  }
  next(action);
}

void getUnviewedMessagesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetUnviewedMessagesAction){
    MessageService()
      .getUnviewedMessages()
      .then((messages){
        store.dispatch(AddMessagesAction(messages: messages.map((e) => e.toMessageState())));
        store.dispatch(AddMessageImagesListAction(list: messages.map(
          (e) => List.generate(e.numberOfImages, (index) => MessageImageState.init(e.id, index)))
        ));
        store.dispatch(AddUserImagesAction(images: messages.map((e) => UserImageState.init(e.conversationId))));
        store.dispatch(const MarkComingMessagesAsReceivedAction());
      });
  }
  next(action);
}

void markComingMessageAsReceivedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkComingMessageAsReceivedAction){
    final messageIds = [action.messageId];
    MessageHub()
      .markMessagesAsReceived(messageIds)
      .then((_) => store.dispatch(MarkComingMessagesAsReceivedSuccessAction(messageIds: messageIds)));
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