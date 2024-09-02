import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';

@immutable
class AddNotificationsAction extends redux.Action{
  final Iterable<NotificationState> notifications;
  const AddNotificationsAction({required this.notifications});
}
@immutable
class AddNotificationAction extends redux.Action{
  final NotificationState notification;
  const AddNotificationAction({required this.notification});
}

@immutable
class MarkNotificationsAsViewedAction extends redux.Action{
  const MarkNotificationsAsViewedAction();
}
@immutable
class MarkNotificationsAsViewedSuccessAction extends redux.Action{
  final Iterable<int> ids;
  const MarkNotificationsAsViewedSuccessAction({required this.ids});
}

