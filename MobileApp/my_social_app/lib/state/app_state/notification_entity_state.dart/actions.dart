import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';

@immutable
class GetNextPageNotificationsIfNoPageAction extends AppAction{
  const GetNextPageNotificationsIfNoPageAction();
}
@immutable 
class GetNextPageNotificationsIfReadyAction extends AppAction{
  const GetNextPageNotificationsIfReadyAction();
}
@immutable
class GetNextPageNotificationsAction extends AppAction {
  const GetNextPageNotificationsAction();
}
@immutable
class AddNextPageNotificationsAction extends AppAction{
  final Iterable<NotificationState> notifications;
  const AddNextPageNotificationsAction({required this.notifications});
}

@immutable
class PrependNotificationAction extends AppAction{
  final NotificationState notification;
  const PrependNotificationAction({required this.notification});
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

