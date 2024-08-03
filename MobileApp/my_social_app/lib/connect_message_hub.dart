import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/message_entity_state/actions.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void connectMessageHub(Store<AppState> store){
  
  final hub = MessageHub();
  
  hub.hubConnection.start();
  
  hub.hubConnection.on(
    receiveMessage, 
    (list){
      final message = Message.fromJson((list!.first as dynamic));
      store.dispatch(
        AddMessageAction(
          message: message.toMessageState()
        )
      );
    }
  );

  hub.hubConnection.on(
    messageReceiptedNotification,
    (list){
      // final messageId = (list!.first as int);
      // print(messageId);
    },
  );

    hub.hubConnection.on(
    messageViewedNotification,
    (list){
      // final message = list!.first;
      // print(message as int);
    }
  );
}