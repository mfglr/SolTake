import 'package:flutter/material.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/solution/pages/display_question_solutions_page.dart';

class SolutionCreatedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const SolutionCreatedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      onPressed: () => Navigator
        .of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => DisplayQuestionSolutionsPage(
              questionId: notification.questionId!,
              offset: notification.solutionId!,
            )
          )
        ),
      icon: const Icon(
        Icons.lightbulb,
        color: Colors.yellow,
      ),
      content: "YAY!!! Your question has been solved!"
    );
  }
}