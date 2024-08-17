import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:badges/badges.dart' as badges;

class NotificationItem extends StatelessWidget {
  final NotificationState notification;
  final String content;
  final Widget icon;
  final void Function() onPressed;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.content,
    required this.icon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => UserPage(userId: notification.userId))),
              child: badges.Badge(
                badgeContent: icon,
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.transparent,
                ),
                child: UserImageWidget(
                  userId: notification.userId,
                  diameter: 45
                ),
              )
            ),
           Expanded(
             child: Text(
                "${notification.userName}. $content ${timeago.format(notification.createdAt,locale: 'en_short')}",
                overflow: TextOverflow.visible,  
              ),
           ),
          ],
        ),
      ),
    );
  }
}