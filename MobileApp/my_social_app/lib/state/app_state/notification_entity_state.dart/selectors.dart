import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

NotificationState? selectNotification(Store<AppState> store, int notificationId)
  => store.state.notifications[notificationId];