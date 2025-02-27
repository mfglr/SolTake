import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
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
      icon: StoreConnector<AppState,Pagination<num,NotificationState>>(
        converter: (store) => store.state.notifications,
        builder: (context,state) => badges.Badge(
          badgeContent: state.select((e) => !e.isViewed).isNotEmpty ? Text(
            state.select((e) => !e.isViewed).length.toString(),
            style:const TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
          ) : null,
          badgeStyle: badges.BadgeStyle(
            badgeColor: state.select((e) => !e.isViewed).isNotEmpty ? Colors.red : Colors.transparent,
          ),
          child: const Icon(Icons.notifications),
        ),
      ),
    );
  }
}