import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_bottom_text_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';
import 'uesr_tagged_int_comment_notification_item_texts.dart';

class UserTaggedInCommentItem extends StatelessWidget {
  final NotificationState notification;
  const UserTaggedInCommentItem({super.key,required this.notification});
  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: content[getLanguage(context)]!,
      icon: const Icon(
        Icons.tag,
        color: Colors.orange,
      ),
      bottomContent: NotificationBottomTextContent(content: notification.commentContent ?? ""),
      onPressed: () => Navigator
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