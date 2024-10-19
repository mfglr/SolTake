import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_bottom_text_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      content: AppLocalizations.of(context)!.question_comment_created_notification_item_content,
      bottomContent: NotificationBottomTextContent(content: notification.commentContent ?? ""),
      onPressed: (){
        Navigator
          .of(context)
          .push(MaterialPageRoute(
            builder: (context) => DisplayQuestionPage(
              questionId: notification.questionId!,
              parentId: notification.commentId,
            ),
          ));
      }
    );
  }
}