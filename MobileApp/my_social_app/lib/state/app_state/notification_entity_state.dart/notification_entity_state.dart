import 'dart:core';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/pagination/entity_pagination.dart';

class NotificationEntityState{
  final EntityPagination<NotificationState> pagination;

  const NotificationEntityState({required this.pagination});

  NotificationEntityState prependNotification(NotificationState notification)
    => NotificationEntityState(pagination: pagination.prependOne(notification));

  NotificationEntityState startLoadingNext()
    => NotificationEntityState(pagination: pagination.startLoadingNext());
  NotificationEntityState stopLoadingNext()
    => NotificationEntityState(pagination: pagination.stopLoadingNext());
  NotificationEntityState addNextPage(Iterable<NotificationState> notifications)
    => NotificationEntityState(pagination: pagination.addNextPage(notifications));

  NotificationEntityState prependNotifications(Iterable<NotificationState> notifications)
    => NotificationEntityState(pagination: pagination.prependMany(notifications));
    
  NotificationEntityState markAsViewed(Iterable<int> ids)
    => NotificationEntityState(pagination: pagination.updateMany(ids.map((e) => pagination.entities[e]!.markAsViewed())));

  Iterable<NotificationState> get notifications => pagination.entities.values;
  int get numberOfUnviewedNotifications => pagination.entities.values.where((e) => !e.isViewed).length;
  Iterable<int> get idsOfUnviewedNotifications => pagination.entities.values.where((e) => !e.isViewed).map((e) => e.id);
}