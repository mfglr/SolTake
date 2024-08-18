import 'package:my_social_app/state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:redux/redux.dart';

NotificationEntityState markNotificationsAsViewedReducer(NotificationEntityState prev,MarkNotificationsAsViewedSuccessAction action)
  => prev.markAsViewed(action.ids);
NotificationEntityState loadUnviewedNotificationsReducer(NotificationEntityState prev,LoadUnviewedNotificationsSuccessAction action)
  => prev.loadUnviewedNotifications(action.notifications);
NotificationEntityState nextPageNotificationsReducer(NotificationEntityState prev,NextPageNotificationsSuccessAction action)
  => prev.nextPageNotifications(action.notifications);

Reducer<NotificationEntityState> notificationEntityStateReducers = combineReducers<NotificationEntityState>([
  TypedReducer<NotificationEntityState,MarkNotificationsAsViewedSuccessAction>(markNotificationsAsViewedReducer).call,
  TypedReducer<NotificationEntityState,LoadUnviewedNotificationsSuccessAction>(loadUnviewedNotificationsReducer).call,
  TypedReducer<NotificationEntityState,NextPageNotificationsSuccessAction>(nextPageNotificationsReducer).call,
]);