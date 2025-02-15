import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/notifications/notification_actions.dart';
import 'package:my_social_app/notifications/notification_titles.dart';
import 'package:my_social_app/notifications/notifications_bodies.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/state.dart';

const _channelId = 'soltake_channel_id';
const _channelName = "soltake_channel_name";

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
const AndroidNotificationDetails _androidDetails = AndroidNotificationDetails(
  _channelId,
  _channelName,
  importance: Importance.max,
  priority: Priority.high
);
const NotificationDetails _platformDetails = NotificationDetails(android: _androidDetails);
const AndroidInitializationSettings _androidSettings = AndroidInitializationSettings('logo');
const InitializationSettings _settings = InitializationSettings(android: _androidSettings);

Future<void> initNotifications(BuildContext context){
  return _flutterLocalNotificationsPlugin
    .initialize(
      _settings,
      onDidReceiveNotificationResponse: (details){
        final store = StoreProvider.of<AppState>(context,listen: false);
        final notification = store.state.notificationEntityState.notifications.firstWhereOrNull((e) => e.id == details.id);
        if(notification != null){
          notficationsActions[notification.type]!(context,notification);
        }
      }
    );
}

Future<void> showNotification(BuildContext context, int notificationId) async {
  final store = StoreProvider.of<AppState>(context,listen: false);
  final notification = store.state.notificationEntityState.notifications.firstWhere((e) => e.id == notificationId);

  await _flutterLocalNotificationsPlugin
    .show(
      notificationId,
      notificationTitles[notification.type]![getLanguage(context)],
      notificationBodies[notification.type]![getLanguage(context)],
      _platformDetails,
    );
}