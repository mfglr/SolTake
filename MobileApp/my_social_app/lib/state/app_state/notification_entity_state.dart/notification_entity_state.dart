import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/entity_state/entity_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';

class NotificationEntityState extends EntityState<NotificationState>{
  final bool isUnviewedNotificationsLoaded;
  final bool isLast;
  final int? lastId;

  const NotificationEntityState({
    required super.containers,
    required this.isUnviewedNotificationsLoaded,
    required this.isLast,
    required this.lastId
  });

  NotificationEntityState addNewNotification(NotificationState notification)
    => NotificationEntityState(
      containers: prependOne(notification), 
      isUnviewedNotificationsLoaded: isUnviewedNotificationsLoaded,
      isLast: isLast,
      lastId: lastId
    );

  NotificationEntityState markAsViewed(Iterable<int> ids)
    => NotificationEntityState(
      containers: updateMany(ids.map((e) => containers[e]!.entity.markAsViewed())),
      isUnviewedNotificationsLoaded: isUnviewedNotificationsLoaded,
      isLast: isLast,
      lastId: lastId
    );

  NotificationEntityState loadUnviewedNotifications(Iterable<NotificationState> notifications)
    => NotificationEntityState(
      containers: appendMany(notifications),
      isUnviewedNotificationsLoaded: true,
      isLast: isLast,
      lastId: notifications.isNotEmpty ? notifications.last.id : lastId
    );
  
  NotificationEntityState nextPageNotifications(Iterable<NotificationState> notifications)
    => NotificationEntityState(
      containers: appendMany(notifications),
      isUnviewedNotificationsLoaded: isUnviewedNotificationsLoaded,
      isLast: notifications.length < notificationsPerPage,
      lastId: notifications.isNotEmpty ? notifications.last.id : lastId
    );

  Iterable<NotificationState> get notifications => containers.values.map((e) => e.entity);
  int get numberOfUnviewedNotifications => containers.values.where((e) => !e.entity.isViewed).length;
  Iterable<int> get idsOfUnviewedNotifications => containers.values.where((e) => !e.entity.isViewed).map((e) => e.entity.id);
}