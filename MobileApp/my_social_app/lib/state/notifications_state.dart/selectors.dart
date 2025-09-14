import 'package:my_social_app/state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:redux/redux.dart';

NotificationState? selectNotification(Store<AppState> store, int notificationId)
  => store.state.notifications[notificationId];