import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:redux/redux.dart';

NotificationEntityState startLoadingNextReducer(NotificationEntityState prev,GetNextPageNotificationsAction action)
  => prev.startLoadingNext();
NotificationEntityState addNextPageReducer(NotificationEntityState prev,AddNextPageNotificationsAction action)
  => prev.addNextPage(action.notifications);

NotificationEntityState addUnviewedNotificationsReducer(NotificationEntityState prev,AddUnviewedNotificationsAction action)
  => prev.prependNotifications(action.notifications);

NotificationEntityState prependNotificationReducer(NotificationEntityState prev, PrependNotificationAction action)
  => prev.prependNotification(action.notification);

NotificationEntityState markNotificationsAsViewedReducer(NotificationEntityState prev,MarkNotificationsAsViewedSuccessAction action)
  => prev.markAsViewed(action.ids);

Reducer<NotificationEntityState> notificationEntityStateReducers = combineReducers<NotificationEntityState>([
  TypedReducer<NotificationEntityState,GetNextPageNotificationsAction>(startLoadingNextReducer).call,
  TypedReducer<NotificationEntityState,AddNextPageNotificationsAction>(addNextPageReducer).call,
  TypedReducer<NotificationEntityState,AddUnviewedNotificationsAction>(addUnviewedNotificationsReducer).call,
  TypedReducer<NotificationEntityState,PrependNotificationAction>(prependNotificationReducer).call,
  TypedReducer<NotificationEntityState,MarkNotificationsAsViewedSuccessAction>(markNotificationsAsViewedReducer).call,
]);