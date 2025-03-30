import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_social_app/models/notification.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class NotificationHub{
  late final HubConnection _hubConnection;
  String? _acessToken;

  NotificationHub._(Store<AppState> store){
    _hubConnection =
      HubConnectionBuilder()
        .withUrl(
          "${dotenv.env['API_URL']}/notification",
          options: HttpConnectionOptions(accessTokenFactory: () => Future.value(_acessToken)),
        )
        .withAutomaticReconnect()
        .build();

    _hubConnection
      .onreconnected(({connectionId}) => store.dispatch(const GetUnviewedNotificationsAction()));

    _hubConnection
      .on(
        'receiveNotification',
        (list) => 
          store
            .dispatch(
              PrependNotificationAction(
                notification: Notification.fromJson(list!.first as dynamic).toNotificationState()
              )
            )
      );
  }

  static NotificationHub? _singleton;
  factory NotificationHub() => _singleton!;
  
  static Future<void> init(String accessToken, Store<AppState> store) async {
    if(_singleton == null){
      _singleton = NotificationHub._(store);
      _singleton!._acessToken = accessToken;
      await _singleton!._hubConnection.start();
      store.dispatch(const GetUnviewedNotificationsAction());
      return;
    }
    _singleton!._acessToken = accessToken;
  }

  Future<void> close() async{
    if(_singleton != null){
      _hubConnection.off('receiveNotification');
      await _hubConnection.stop();
    }
    _singleton = null;
  }


}