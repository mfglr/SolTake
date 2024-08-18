import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/entity_state.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_state.dart';

class NotificationEntityState extends EntityState<NotificationState>{
  final bool isUnviewedNotificationsLoaded;
  final bool isLast;
  final int? lastId;

  const NotificationEntityState({
    required super.entities,
    required this.isUnviewedNotificationsLoaded,
    required this.isLast,
    required this.lastId
  });

  NotificationEntityState markAsViewed(Iterable<int> ids)
    => NotificationEntityState(
      entities: updateMany(ids.map((e) => entities[e]!.markAsViewed())),
      isUnviewedNotificationsLoaded: isUnviewedNotificationsLoaded,
      isLast: isLast,
      lastId: lastId
    );

  NotificationEntityState loadUnviewedNotifications(Iterable<NotificationState> notifications)
    => NotificationEntityState(
      entities: appendMany(notifications),
      isUnviewedNotificationsLoaded: true,
      isLast: isLast,
      lastId: notifications.isNotEmpty ? notifications.last.id : lastId
    );
  
  NotificationEntityState nextPageNotifications(Iterable<NotificationState> notifications)
    => NotificationEntityState(
      entities: appendMany(notifications),
      isUnviewedNotificationsLoaded: isUnviewedNotificationsLoaded,
      isLast: notifications.length < notificationsPerPage,
      lastId: notifications.isNotEmpty ? notifications.last.id : lastId
    );

  Iterable<NotificationState> get notifications => entities.values;
  int get numberOfUnviewedNotifications => entities.values.where((e) => !e.isViewed).length;
  Iterable<int> get idsOfUnviewedNotifications => entities.values.where((e) => !e.isViewed).map((e) => e.id);
}