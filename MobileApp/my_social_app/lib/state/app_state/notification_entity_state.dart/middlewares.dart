import 'package:my_social_app/services/notification_service.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void markNotificationsAsViewedMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is MarkNotificationsAsViewedAction){
    final ids = store.state.notificationEntityState.idsOfUnviewedNotifications;
    if(ids.isNotEmpty){
      NotificationService()
        .markNotificationsAsViewed(ids.toList())
        .then((_) => store.dispatch(MarkNotificationsAsViewedSuccessAction(ids: ids)));
    }
  }
  next(action);
}

void getUnviewedNotificationMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetUnviewedNotificationsAction){
    NotificationService()
      .getUnviewedNotifications()
      .then(
        (notifications){
          store.dispatch(AddUnviewedNotificationsAction(notifications: notifications.map((e) => e.toNotificationState())));
        }
      );
  }
  next(action);
}

void getNextPageNotificationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextNotificationsAction){
    NotificationService()
      .getNotifications(store.state.notificationEntityState.pagination.next)
      .then((notifications){
        store.dispatch(NextNotificationsSuccessAction(notifications: notifications.map((e) => e.toNotificationState())));
      })
      .catchError((e){
        store.dispatch(const NextNotificationsFailedAction());
        throw e;
      });
  }
  next(action);
}
