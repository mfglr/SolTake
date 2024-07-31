import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  
}