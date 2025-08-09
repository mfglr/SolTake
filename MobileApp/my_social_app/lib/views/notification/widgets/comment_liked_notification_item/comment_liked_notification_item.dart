import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/comment_liked_notification_item/comment_liked_notification_item_texts.dart' show content;
import 'package:my_social_app/views/notification/widgets/notification_bottom_text_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page/display_question_page.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';

class CommentLikedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const CommentLikedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: content[getLanguage(context)]!,
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      bottomContent: NotificationBottomTextContent(content: notification.commentContent!),
      onPressed: ()
        =>
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (context) 
                  => 
                    notification.solutionId != null
                      ? DisplaySolutionPage(solutionId: notification.solutionId!)
                      : DisplayQuestionPage(questionId: notification.questionId!)
              )
            )
    );
  }
}