import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:rxdart/rxdart.dart';
import 'package:signalr_netcore/signalr_client.dart';

class MessageHub{
  final HubConnection _hubConnection = 
    HubConnectionBuilder()
      .withUrl("${dotenv.env['API_URL']}/message?access_token=${store.state.accessToken}")
      .build();
      
  final receivedMessages = PublishSubject<MessageState>();

  HubConnection get hubConnection => _hubConnection;

  MessageHub._();
  static final MessageHub _singleton = MessageHub._();
  factory MessageHub() => _singleton;
  
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