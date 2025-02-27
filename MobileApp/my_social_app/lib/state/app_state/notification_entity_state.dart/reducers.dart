import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:redux/redux.dart';

Pagination<num,NotificationState> nextNotificationsReducer(Pagination<num,NotificationState> prev, NextNotificationsAction action)
  => prev.startLoadingNext();
Pagination<num,NotificationState> nextNotificationsSuccessReducer(Pagination<num,NotificationState> prev,NextNotificationsSuccessAction action)
  => prev.addNextPage(action.notifications);
Pagination<num,NotificationState> nextNotificationsFailedReducer(Pagination<num,NotificationState> prev, NextNotificationsFailedAction action)
  => prev.stopLoadingNext();

Pagination<num,NotificationState> addUnviewedNotificationsReducer(Pagination<num,NotificationState> prev,AddUnviewedNotificationsAction action)
  => prev.prependMany(action.notifications);
Pagination<num,NotificationState> prependNotificationReducer(Pagination<num,NotificationState> prev, PrependNotificationAction action)
  => prev.prependOne(action.notification);
Pagination<num,NotificationState> markNotificationsAsViewedReducer(Pagination<num,NotificationState> prev,MarkNotificationsAsViewedSuccessAction action)
  => prev.updateMany(prev.getByIds(action.ids).map((e) => e.markAsViewed()));

Reducer<Pagination<num,NotificationState>> notificationEntityStateReducers = combineReducers<Pagination<num,NotificationState>>([
  TypedReducer<Pagination<num,NotificationState>,NextNotificationsAction>(nextNotificationsReducer).call,
  TypedReducer<Pagination<num,NotificationState>,NextNotificationsSuccessAction>(nextNotificationsSuccessReducer).call,
  TypedReducer<Pagination<num,NotificationState>,NextNotificationsFailedAction>(nextNotificationsFailedReducer).call,

  TypedReducer<Pagination<num,NotificationState>,AddUnviewedNotificationsAction>(addUnviewedNotificationsReducer).call,
  TypedReducer<Pagination<num,NotificationState>,PrependNotificationAction>(prependNotificationReducer).call,
  TypedReducer<Pagination<num,NotificationState>,MarkNotificationsAsViewedSuccessAction>(markNotificationsAsViewedReducer).call,
]);