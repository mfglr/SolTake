import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';

class QuestionCommentCreatedNotificationItem extends StatelessWidget {
  
  final NotificationState notification;
  const QuestionCommentCreatedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      icon: const Icon(
        Icons.comment,
        color: Colors.blue,
      ),
      content: "Your question has been commented",
      onPressed: (){
        Navigator
          .of(context)
          .push(MaterialPageRoute(
            builder: (context) => DisplayQuestionPage(
              questionId: notification.questionId!,
              isOpenCommentModal: true,
              displayCommentId: notification.commentId,
            ),
          ));
       
      }
    );
  }
}