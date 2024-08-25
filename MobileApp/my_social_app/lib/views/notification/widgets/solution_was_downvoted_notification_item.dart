import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';

class SolutionWasDownvotedNotificationItem extends StatelessWidget {
  final NotificationState notification;

  const SolutionWasDownvotedNotificationItem({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: "Oh No🙁 Your solution has been downvoted!👎",
      icon: const Icon(
        Icons.thumb_down,
        color: Colors.red,
      ),
      onPressed: ()
        => Navigator
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