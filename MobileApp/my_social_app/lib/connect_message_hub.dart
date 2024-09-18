import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';
import 'package:signalr_netcore/signalr_client.dart';

void connectMessageHub(Store<AppState> store){
  final hub = MessageHub();
  
  if(hub.hubConnection.state == HubConnectionState.Connected){
    hub.hubConnection
      .stop()
      .then((_){
        hub.hubConnection
          .start()
          ?.then((_){
            store.dispatch(const GetUnviewedMessagesAction());
          });
      });
  }
  else{
    hub.hubConnection
      .start()
      ?.then((_){
        store.dispatch(const GetUnviewedMessagesAction());
      });
  }
  
  
  hub.hubConnection.on(
    receiveMessage,
    (list){
      final message = Message.fromJson((list!.first as dynamic));
      final messageState = message.toMessageState();

      hub.receivedMessages.add(messageState);

      store.dispatch(AddMessageAction(message: messageState));
      store.dispatch(AddMessageImagesAction(images: List.generate(
        message.numberOfImages, (index) => MessageImageState.init(message.id, index))
      ));
      store.dispatch(AddUserMessageAction(userId: message.senderId, messageId: message.id));
      store.dispatch(AddUserImageAction(image: UserImageState.init(message.senderId)));
      store.dispatch(MarkComingMessageAsReceivedAction(messageId: message.id));
    }
  );

  hub.hubConnection.on(
    messageReceivedNotification,
    (list){
      final message = Message.fromJson((list!.first as dynamic)).toMessageState();
      
      store.dispatch(MarkOutgoingMessageAsReceivedAction(message: message));
      store.dispatch(AddMessageImagesAction(images: List.generate(
        message.numberOfImages, (index) => MessageImageState.init(message.id, index))
      ));
      store.dispatch(AddUserMessageAction(userId: message.senderId, messageId: message.id));
      store.dispatch(AddUserImageAction(image: UserImageState.init(message.senderId)));
      
    },
  );

  hub.hubConnection.on(
    messageViewedNotification,
    (list){
      final message = Message.fromJson((list!.first as dynamic)).toMessageState();

      store.dispatch(MarkOutgoingMessageAsViewedAction(message: message));
      store.dispatch(AddMessageImagesAction(images: List.generate(
        message.numberOfImages, (index) => MessageImageState.init(message.id, index))
      ));
      store.dispatch(AddUserMessageAction(userId: message.senderId, messageId: message.id));
      store.dispatch(AddUserImageAction(image: UserImageState.init(message.senderId)));
    }
  );
}