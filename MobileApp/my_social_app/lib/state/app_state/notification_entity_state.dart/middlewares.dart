import 'package:my_social_app/constants/record_per_page.dart';
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

void loadUnviewedNotificationMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadUnviewedNotificationsAction){
    if(!store.state.notificationEntityState.isUnviewedNotificationsLoaded){
      NotificationService()
        .getUnviewedNotifications()
        .then(
          (notifications){
            store.dispatch(LoadUnviewedNotificationsSuccessAction(notifications: notifications.map((e) => e.toNotificationState())));
            store.dispatch(AddUserImagesAction(images: notifications.map((e) => UserImageState.init(e.userId))));
          }
        );
    }
  }
  next(action);
}

void nextPageNotificationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageNotificationsAction){
    if(!store.state.notificationEntityState.isLast){
      NotificationService()
        .getNotifications(store.state.notificationEntityState.lastId,notificationsPerPage,true)
        .then(
          (notifications){
            store.dispatch(NextPageNotificationsSuccessAction(notifications: notifications.map((e) => e.toNotificationState())));
            store.dispatch(AddUserImagesAction(images: notifications.map((e) => UserImageState.init(e.userId))));
          }
        );
    }
  }
  next(action);
}

void nextPageNotificationsIfNoNoficationsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextPageNotificationsIfNoNotificationsActions){
    if(store.state.notificationEntityState.notifications.length < notificationsPerPage){
      store.dispatch(
        const NextPageNotificationsAction()
      );
    }
  }
  next(action);
}