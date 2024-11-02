import 'package:flutter/material.dart';
import 'package:my_social_app/notifications/notification_actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      content: AppLocalizations.of(context)!.user_followed_notification_item_content,
      icon: const Icon(
        Icons.person_add,
        color: Colors.blue,
      ),
      onPressed: () => notficationsActions[notification.type]!(context,notification)
    );
  }
}