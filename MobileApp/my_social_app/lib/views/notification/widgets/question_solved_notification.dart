import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';

class QuestionSolvedNotification extends StatelessWidget {
  final NotificationState notification;
  const QuestionSolvedNotification({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: "YAY!!!🥳 Your question has been solved. Click to display the solution.",
      icon: const Icon(
        Icons.check,
        color: Colors.green,
      ),
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
    );
  }
}