import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SolutionMarkedAsCorrectNotificationItem extends StatelessWidget {
  final NotificationState notification;
  
  const SolutionMarkedAsCorrectNotificationItem({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: AppLocalizations.of(context)!.solution_marked_as_correct_notification_item_context,
      icon: const Icon(
        Icons.done,
        color: Colors.green,
      ),
      onPressed: () => Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => DisplaySolutionPage(
                solutionId: notification.solutionId!
              )
            )
          )
    );
  }
}