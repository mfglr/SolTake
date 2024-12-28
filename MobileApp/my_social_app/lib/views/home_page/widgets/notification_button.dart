import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_entity_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/notification/pages/notification_page.dart';
import 'package:badges/badges.dart' as badges;

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(const MarkNotificationsAsViewedAction());
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationPage()));
      },
      icon: StoreConnector<AppState,NotificationEntityState>(
        converter: (store) => store.state.notificationEntityState,
        builder: (context,state) => badges.Badge(
          badgeContent: state.numberOfUnviewedNotifications > 0 ? Text(
            state.numberOfUnviewedNotifications.toString(),
            style:const TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
          ) : null,
          badgeStyle: badges.BadgeStyle(
            badgeColor: state.numberOfUnviewedNotifications > 0 ? Colors.red : Colors.transparent,
          ),
          child: const Icon(Icons.notifications),
        ),
      ),
    );
  }
}