import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/image_status.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/message_home_page_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/user_image_entity_state/user_image_state.dart';
import 'package:redux/redux.dart';

void connectMessageHub(Store<AppState> store){
  
  final hub = MessageHub();
  
  hub.hubConnection
    .start()
    ?.then((_){
      store.dispatch(const GetCommingMessagesAction());
    });
  
  hub.hubConnection.on(
    receiveMessage1,
    (list){
      final message = Message.fromJson((list!.first as dynamic));
      store.dispatch(AddMessageAction(message: message.toMessageState()));
      store.dispatch(AddUserMessageAction(userId: message.senderId, messageId: message.id));
      store.dispatch(AddUserImageAction(image: UserImageState(id: message.senderId,image: null,state: ImageStatus.notStarted)));
      store.dispatch(MarkComingMessageAsReceivedAction(messageId: message.id));
    }
  );

  hub.hubConnection.on(
    messageReceivedNotification,
    (list){
      final message = Message.fromJson((list!.first as dynamic));
      store.dispatch(MarkOutgoingMessageAsReceivedAction(message: message.toMessageState()));
      store.dispatch(AddUserImageAction(image: UserImageState(id: message.senderId,image: null,state: ImageStatus.notStarted)));
    },
  );

  hub.hubConnection.on(
    messageViewedNotification,
    (list){
      final message = Message.fromJson((list!.first as dynamic));
      store.dispatch(MarkOutgoingMessageAsViewedAction(message: message.toMessageState()));
      store.dispatch(AddUserImageAction(image: UserImageState(id: message.senderId,image: null,state: ImageStatus.notStarted)));
    }
  );
}