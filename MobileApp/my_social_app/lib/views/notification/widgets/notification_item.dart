import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:badges/badges.dart' as badges;

class NotificationItem extends StatelessWidget {
  final NotificationState notification;
  final String content;
  final Widget icon;
  final void Function() onPressed;
  final Widget? bottomContent;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.content,
    required this.icon,
    required this.onPressed,
    this.bottomContent
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: GestureDetector(
          onTap: onPressed,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(
                  onPressed: () => Navigator
                    .of(context)
                    .push(MaterialPageRoute(builder: (context) => UserPage(userId: notification.userId))),
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: badges.Badge(
                    badgeContent: icon,
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Colors.transparent,
                    ),
                    child: AppAvatar(
                      avatar: notification,
                      diameter: 45
                    ),
                  )
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StoreConnector<AppState,String>(
                      converter: (store) => store.state.loginState!.language,
                      builder:(context,language) => Text(
                        "${notification.userName}. $content ${timeago.format(notification.createdAt,locale: '${language}_short')}",
                      ),
                    ),
                    if(bottomContent != null)
                      Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: bottomContent!,
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}