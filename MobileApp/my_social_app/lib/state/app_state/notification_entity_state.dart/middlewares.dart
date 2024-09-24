import 'package:my_social_app/services/notification_service.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_image_entity_state/user_image_state.dart';
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
          store.dispatch(AddUserImagesAction(images: notifications.map((e) => UserImageState.init(e.appUserId))));
        }
      );
  }
  next(action);
}

void getNextPageNotificationsIfNoPageMiddeware(Store<AppState> store,action, NextDispatcher next){
  if(action is GetNextPageNotificationsIfNoPageAction){
    final pagination = store.state.notificationEntityState.pagination;
    if(pagination.isReadyForNextPage && !pagination.hasAtLeastOnePage){
      store.dispatch(const GetNextPageNotificationsAction());
    }
  }
  next(action);
}
void getNextPageNotificationsIfReadyActionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageNotificationsIfReadyAction){
    final pagination = store.state.notificationEntityState.pagination;
    if(pagination.isReadyForNextPage){
      store.dispatch(const GetNextPageNotificationsAction());
    }
  }
  next(action);
}
void getNextPageNotificationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is GetNextPageNotificationsAction){
    NotificationService()
      .getNotifications(store.state.notificationEntityState.pagination.next)
      .then((notifications){
        store.dispatch(AddNextPageNotificationsAction(notifications: notifications.map((e) => e.toNotificationState())));
        store.dispatch(AddUserImagesAction(images: notifications.map((e) => UserImageState.init(e.appUserId))));
      });
  }
  next(action);
}
