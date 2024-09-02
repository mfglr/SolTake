import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:redux/redux.dart';

NotificationEntityState addNotificationsReducer(NotificationEntityState prev,AddNotificationsAction action)
  => prev.addNotificaitons(action.notifications);
NotificationEntityState addNotificationReducer(NotificationEntityState prev, AddNotificationAction action)
  => prev.addNewNotification(action.notification);
NotificationEntityState markNotificationsAsViewedReducer(NotificationEntityState prev,MarkNotificationsAsViewedSuccessAction action)
  => prev.markAsViewed(action.ids);

Reducer<NotificationEntityState> notificationEntityStateReducers = combineReducers<NotificationEntityState>([
  TypedReducer<NotificationEntityState,AddNotificationAction>(addNotificationReducer).call,
  TypedReducer<NotificationEntityState,MarkNotificationsAsViewedSuccessAction>(markNotificationsAsViewedReducer).call,
  TypedReducer<NotificationEntityState,AddNotificationsAction>(addNotificationsReducer).call,
]);