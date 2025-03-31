import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';

@immutable
class NextNotificationsAction extends AppAction {
  const NextNotificationsAction();
}
@immutable
class NextNotificationsSuccessAction extends AppAction{
  final Iterable<NotificationState> notifications;
  const NextNotificationsSuccessAction({required this.notifications});
}
@immutable
class NextNotificationsFailedAction extends AppAction{
  const NextNotificationsFailedAction();
}

@immutable
class PrependNotificationAction extends AppAction{
  final NotificationState notification;
  const PrependNotificationAction({required this.notification});
}
@immutable
class RemoveNotificationAction extends AppAction{
  final int notificationId;
  const RemoveNotificationAction({required this.notificationId});
}

@immutable
class GetUnviewedNotificationsAction extends AppAction{
  const GetUnviewedNotificationsAction();
}
@immutable
class AddUnviewedNotificationsAction extends AppAction{
  final Iterable<NotificationState> notifications;
  const AddUnviewedNotificationsAction({required this.notifications});
}

@immutable
class MarkNotificationsAsViewedAction extends AppAction{
  const MarkNotificationsAsViewedAction();
}
@immutable
class MarkNotificationsAsViewedSuccessAction extends AppAction{
  final Iterable<int> ids;
  const MarkNotificationsAsViewedSuccessAction({required this.ids});
}

