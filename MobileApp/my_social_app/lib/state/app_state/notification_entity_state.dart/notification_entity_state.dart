import 'dart:core';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';

class NotificationEntityState extends EntityState<NotificationState>{
  const NotificationEntityState({required super.entities});

  NotificationEntityState addNewNotification(NotificationState notification)
    => NotificationEntityState(entities: prependOne(notification));
  NotificationEntityState addNotificaitons(Iterable<NotificationState> notifications)
    => NotificationEntityState(entities: appendMany(notifications));
  NotificationEntityState markAsViewed(Iterable<int> ids)
    => NotificationEntityState(entities: updateMany(ids.map((e) => entities[e]!.markAsViewed())));

  Iterable<NotificationState> get notifications => entities.values;
  int get numberOfUnviewedNotifications => entities.values.where((e) => !e.isViewed).length;
  Iterable<int> get idsOfUnviewedNotifications => entities.values.where((e) => !e.isViewed).map((e) => e.id);
}