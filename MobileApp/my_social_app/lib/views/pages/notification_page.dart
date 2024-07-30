import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/notification/notification_items.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
      ),
      body: StoreConnector<AppState,Iterable<NotificationState>>(
        onInit: (store) => store.dispatch(const NextPageNotificationsIfNoNotificationsActions()),
        converter: (store) => store.state.notificationEntityState.notifications,
        builder: (context,notifications) => SingleChildScrollView(
          child: NotificationItems(
            notifications: notifications
          ),
        )
      ),
    );
  }
}