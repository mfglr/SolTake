import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

void connectMessageHub(Store<AppState> store){
  final hub = MessageHub();
        
        hub.hubConnection.start();
        
        hub.hubConnection.on(
          receiveMessage, 
          (list){
            // final message = list?.first;
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