import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';

@immutable
class MarkNotificationsAsViewedAction extends redux.Action{
  const MarkNotificationsAsViewedAction();
}
@immutable
class MarkNotificationsAsViewedSuccessAction extends redux.Action{
  final Iterable<int> ids;
  const MarkNotificationsAsViewedSuccessAction({required this.ids});
}

@immutable
class LoadUnviewedNotificationsAction extends redux.Action{
  const LoadUnviewedNotificationsAction();
}
@immutable
class LoadUnviewedNotificationsSuccessAction extends redux.Action{
  final Iterable<NotificationState> notifications;
  const LoadUnviewedNotificationsSuccessAction({required this.notifications});
}

@immutable
class NextPageNotificationsAction extends redux.Action{
  const NextPageNotificationsAction();
}
@immutable
class NextPageNotificationsSuccessAction extends redux.Action{
  final Iterable<NotificationState> notifications;
  const NextPageNotificationsSuccessAction({required this.notifications});
}
@immutable
class NextPageNotificationsIfNoNotificationsActions extends redux.Action{
  const NextPageNotificationsIfNoNotificationsActions();
}