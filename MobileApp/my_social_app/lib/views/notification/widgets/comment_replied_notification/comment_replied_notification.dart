import 'package:flutter/material.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_bottom_text_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page/display_question_page.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';
import 'comment_replied_notification_texts.dart';

class CommentRepliedNotification extends StatelessWidget {
  final NotificationState notification;
  const CommentRepliedNotification({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: content[getLanguage(context)]!,
      icon: const Icon(
        Icons.reply,
        color: Colors.green,
      ),
      bottomContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationBottomTextContent(content: notification.repliedContent!),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: NotificationBottomTextContent(content: notification.commentContent!),
          )
        ],
      ),
      onPressed: () =>
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