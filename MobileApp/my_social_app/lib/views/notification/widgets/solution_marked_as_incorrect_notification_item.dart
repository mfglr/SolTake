import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SolutionMarkedAsIncorrectNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const SolutionMarkedAsIncorrectNotificationItem({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: AppLocalizations.of(context)!.solution_marked_as_incorrect_notification_imte_content,
      icon: const Icon(
        Icons.close,
        color: Colors.red,
      ),
      onPressed: () => {}
    );
  }
}