import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class NotificationHub{
  final HubConnection _hubConnection = 
    HubConnectionBuilder()
      .withUrl("${dotenv.env['API_URL']}/notification?access_token=${store.state.accessToken}")
      .build();
  HubConnection get hubConnection => _hubConnection;
}