import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SolutionWasUpvotedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const SolutionWasUpvotedNotificationItem({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: AppLocalizations.of(context)!.solution_was_upvoted_notification_item_content,
      icon: const Icon(
        Icons.thumb_up,
        color: Colors.green,
      ),
      onPressed: () => {}
    );
  }
}