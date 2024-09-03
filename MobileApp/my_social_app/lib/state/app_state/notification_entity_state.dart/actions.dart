import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';

@immutable
class GetNextPageNotificationsIfNoPageAction extends redux.Action{
  const GetNextPageNotificationsIfNoPageAction();
}
@immutable 
class GetNextPageNotificationsIfReadyAction extends redux.Action{
  const GetNextPageNotificationsIfReadyAction();
}
@immutable
class GetNextPageNotificationsAction extends redux.Action {
  const GetNextPageNotificationsAction();
}
@immutable
class AddNextPageNotificationsAction extends redux.Action{
  final Iterable<NotificationState> notifications;
  const AddNextPageNotificationsAction({required this.notifications});
}

@immutable
class PrependNotificationAction extends redux.Action{
  final NotificationState notification;
  const PrependNotificationAction({required this.notification});
}

@immutable
class GetUnviewedNotificationsAction extends redux.Action{
  const GetUnviewedNotificationsAction();
}
@immutable
class AddUnviewedNotificationsAction extends redux.Action{
  final Iterable<NotificationState> notifications;
  const AddUnviewedNotificationsAction({required this.notifications});
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

