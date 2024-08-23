import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';


class SolutionCreatedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const SolutionCreatedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      onPressed: () => 
        Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => DisplaySolutionPage(
                solutionId: notification.solutionId!
              )
            )
          ),
      icon: const Icon(
        Icons.lightbulb,
        color: Colors.yellow,
      ),
      content: "A solution has been created for your question.😊👊 Click to check the solution."
    );
  }
}