import 'package:flutter/material.dart';
import 'package:my_social_app/notifications/notification_actions.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SolutionCreatedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const SolutionCreatedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: AppLocalizations.of(context)!.solution_created_notification_item_content,
      onPressed: () => notficationsActions[notification.type]!(context,notification),
      icon: const Icon(
        Icons.lightbulb,
        color: Colors.yellow,
      ),
    );
  }
}