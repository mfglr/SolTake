import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/models/message_connection.dart';
import 'package:my_social_app/state/app_state/message_connection_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:redux/redux.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class MessageHub{
  late final HubConnection _hubConnection;
  String? _acessToken;

  MessageHub._(Store<AppState> store){
    _hubConnection =
      HubConnectionBuilder()
        .withUrl(
          "${dotenv.env['API_URL']}/message",
          options: HttpConnectionOptions(accessTokenFactory: () async => _acessToken!),
        )
        .withAutomaticReconnect()
        .build();
    _on(store);
  }

  static MessageHub? _singleton;
  factory MessageHub() => _singleton!;
  
  static Future<void> init(String accessToken, Store<AppState> store) async {
    if(_singleton == null){
      _singleton = MessageHub._(store);
      _singleton!._acessToken = accessToken;
      await _singleton!._hubConnection.start();
      return;
    }
    _singleton!._acessToken = accessToken;
  }

  void _on(Store<AppState> store){
    _hubConnection.on(
      changeMessageConnectionState,
      (list) =>
        store.dispatch(
          ChangeMessageConnectionStateAction(
            state: MessageConnection.fromJson(list!.first as dynamic).toMessageConnectionState()
          )
        )
    );
    _hubConnection.on(
      receiveMessage,
      (list){
        final messageState = Message.fromJson((list!.first as dynamic)).toMessageState();
        store.dispatch(AddMessageAction(message: messageState));
        store.dispatch(AddUserMessageAction(userId: messageState.senderId, messageId: messageState.id));
        store.dispatch(MarkComingMessageAsReceivedAction(messageId: messageState.id));
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

  // void _off(){
  //   _hubConnection.off(changeMessageConnectionState);
  //   _hubConnection.off(receiveMessage);
  //   _hubConnection.off(messageReceivedNotification);
  //   _hubConnection.off(messageViewedNotification);
  // }

  Future<Message> createMessage(num receiverId,String content)
    => _hubConnection
        .invoke(createMessageWebSocket, args: [{'receiverId': receiverId, 'content': content}])
        .then((response) => Message.fromJson(response as dynamic));
  
  Future changeState(int state, int? userId)
    => _hubConnection
        .invoke("ChangeState", args: [{'state': state, 'userId': userId}]);

  Future<void> markMessagesAsReceived(Iterable<num> ids)
    => _hubConnection
        .invoke(markMessagesAsReceivedWebSocket, args: [{'ids': ids.toList()}]);

  Future<void> markMessagesAsViewed(Iterable<num> ids)
    => _hubConnection
        .invoke(markMessagesAsViewedWebSocket,args: [{'ids': ids.toList()}]);


  Future<MessageConnection> getById(int userId)
    => _hubConnection
        .invoke("GetById", args: [{'id': userId}])
        .then((json) => MessageConnection.fromJson(json as dynamic));

}