import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';
import 'package:signalr_netcore/signalr_client.dart';

class MessageHub{
  late final HubConnection _hubConnection;
  late final PublishSubject<MessageState> receivedMessages;
  late final StreamSubscription<HubConnectionState> _stateConsumer;

  MessageHub._(Store<AppState> store,PublishSubject<MessageState>? rMs){
    _hubConnection =
      HubConnectionBuilder()
        .withUrl("${dotenv.env['API_URL']}/message?access_token=${store.state.accessToken}")
        .withAutomaticReconnect()
        .build();

    receivedMessages = rMs ?? PublishSubject<MessageState>();
    
    _stateConsumer = _hubConnection.stateStream
      .distinct()
      .listen((state){
        if(state == HubConnectionState.Connected){
          store.dispatch(const GetUnviewedMessagesAction());
        }
      });
  }
  static MessageHub? _singleton;
  factory MessageHub() => _singleton!;
  static Future init(Store<AppState> store) async {
    if(_singleton != null){
      _singleton!._off();
      await _singleton!._stateConsumer.cancel();
      await _singleton!._hubConnection.stop();
      _singleton = MessageHub._(store,_singleton!.receivedMessages);
    }
    else{
      _singleton = MessageHub._(store,null);
    }
    await _singleton!._hubConnection.start();
    _singleton!._on(store);
  }
  
  static Future close() async{
    if(_singleton != null){
      _singleton!._off();
      await _singleton!._stateConsumer.cancel();
      await _singleton!._hubConnection.stop();
    }
  }

  void _on(Store<AppState> store){
    _hubConnection.on(
      receiveMessage,
      (list){
        final message = Message.fromJson((list!.first as dynamic));
        final messageState = message.toMessageState();

        receivedMessages.add(messageState);

        store.dispatch(AddMessageAction(message: messageState));
        store.dispatch(AddUserMessageAction(userId: message.senderId, messageId: message.id));
        store.dispatch(MarkComingMessageAsReceivedAction(messageId: message.id));
      }
    );

    _hubConnection.on(
      messageReceivedNotification,
      (list){
        final message = Message.fromJson((list!.first as dynamic)).toMessageState();
        
        store.dispatch(MarkOutgoingMessageAsReceivedAction(message: message));
        store.dispatch(AddUserMessageAction(userId: message.senderId, messageId: message.id));
        
      },
    );

    _hubConnection.on(
      messageViewedNotification,
      (list){
        final message = Message.fromJson((list!.first as dynamic)).toMessageState();

        store.dispatch(MarkOutgoingMessageAsViewedAction(message: message));
        store.dispatch(AddUserMessageAction(userId: message.senderId, messageId: message.id));
      }
    );
  }

  void _off(){
    _hubConnection.off(receiveMessage);
    _hubConnection.off(messageReceivedNotification);
    _hubConnection.off(messageViewedNotification);
  }

  Future<Message> createMessage(int receiverId,String content)
    => _hubConnection
        .invoke(
          createMessageWebSocket, 
          args: [{'receiverId': receiverId,'content': content}]
        )
        .then((response) => Message.fromJson(response as dynamic));

  Future<void> markMessagesAsReceived(Iterable<int> ids)
    => _hubConnection
        .invoke(
          markMessagesAsReceivedWebSocket,
          args: [{'ids': ids.toList()}]
        );

  Future<void> markMessagesAsViewed(Iterable<int> ids)
    => _hubConnection
        .invoke(
          markMessagesAsViewedWebSocket,
          args: [{'ids': ids.toList()}]
        );
}