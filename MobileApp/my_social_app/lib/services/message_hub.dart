import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/constants/message_functions.dart';
import 'package:my_social_app/models/message.dart';
import 'package:my_social_app/state/store.dart';
import 'package:signalr_netcore/signalr_client.dart';

class MessageHub{
  final HubConnection _hubConnection = 
    HubConnectionBuilder()
      .withUrl("${dotenv.env['API_URL']}/message?access_token=${store.state.accessToken}")
      .build();

  HubConnection get hubConnection => _hubConnection;

  MessageHub._();
  static final MessageHub _singleton = MessageHub._();
  factory MessageHub() => _singleton;
  
  Future<Message> createMessage(int receiverId,String? content){
    return _hubConnection
      .invoke(
        createMessageWebSocket, 
        args: [(receiverId: receiverId,content: content)]
      )
      .then((response) => Message.fromJson(response as dynamic));
  }
}