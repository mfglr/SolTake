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
