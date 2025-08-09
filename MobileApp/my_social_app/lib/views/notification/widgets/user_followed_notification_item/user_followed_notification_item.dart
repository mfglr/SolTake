import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page_by_id.dart';
import 'user_followed_notification_item_texts.dart';

class UserFollowedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const UserFollowedNotificationItem({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: content[getLanguage(context)]!,
      icon: const Icon(
        Icons.person_add,
        color: Colors.blue,
      ),
      onPressed: () => Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (context) => UserPageById(userId: notification.userId,)))
    );
  }
}