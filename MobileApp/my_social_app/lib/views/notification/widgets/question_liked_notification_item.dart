import 'package:flutter/material.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_user_questions_page.dart';

class QuestionLikedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const QuestionLikedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      onPressed: (){
        Navigator
          .of(context)
          .push(MaterialPageRoute(
            builder: (context) => DisplayUserQuestionsPage(
              questionOffset: notification.questionId!,
              userId: notification.ownerId,
            )
          ));
      },
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,  
      ),
      content: "Your question has been liked.",
    );
  }
}