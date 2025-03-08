import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<int,NotificationState> nextNotificationsReducer(Pagination<int,NotificationState> prev, NextNotificationsAction action)
  => prev.startLoadingNext();
Pagination<int,NotificationState> nextNotificationsSuccessReducer(Pagination<int,NotificationState> prev,NextNotificationsSuccessAction action)
  => prev.addNextPage(action.notifications);
Pagination<int,NotificationState> nextNotificationsFailedReducer(Pagination<int,NotificationState> prev, NextNotificationsFailedAction action)
  => prev.stopLoadingNext();

Pagination<int,NotificationState> addUnviewedNotificationsReducer(Pagination<int,NotificationState> prev,AddUnviewedNotificationsAction action)
  => prev.prependMany(action.notifications);
Pagination<int,NotificationState> prependNotificationReducer(Pagination<int,NotificationState> prev, PrependNotificationAction action)
  => prev.prependOne(action.notification);
Pagination<int,NotificationState> markNotificationsAsViewedReducer(Pagination<int,NotificationState> prev,MarkNotificationsAsViewedSuccessAction action)
  => prev.updateMany(prev.getByIds(action.ids).map((e) => e.markAsViewed()));

Reducer<Pagination<int,NotificationState>> notificationEntityStateReducers = combineReducers<Pagination<int,NotificationState>>([
  TypedReducer<Pagination<int,NotificationState>,NextNotificationsAction>(nextNotificationsReducer).call,
  TypedReducer<Pagination<int,NotificationState>,NextNotificationsSuccessAction>(nextNotificationsSuccessReducer).call,
  TypedReducer<Pagination<int,NotificationState>,NextNotificationsFailedAction>(nextNotificationsFailedReducer).call,

  TypedReducer<Pagination<int,NotificationState>,AddUnviewedNotificationsAction>(addUnviewedNotificationsReducer).call,
  TypedReducer<Pagination<int,NotificationState>,PrependNotificationAction>(prependNotificationReducer).call,
  TypedReducer<Pagination<int,NotificationState>,MarkNotificationsAsViewedSuccessAction>(markNotificationsAsViewedReducer).call,
]);