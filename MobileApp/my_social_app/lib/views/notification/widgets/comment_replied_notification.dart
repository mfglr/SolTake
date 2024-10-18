import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_bottom_text_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      content: AppLocalizations.of(context)!.comment_replied_notification_content,
      icon: const Icon(
        Icons.reply,
        color: Colors.green,
      ),
      bottomContent: NotificationBottomTextContent(content: notification.commentContent!),
      onPressed: (){
        if(notification.questionId != null){
          Navigator
            .of(context)
            .push(MaterialPageRoute(
              builder: (context) => DisplayQuestionPage(
                questionId: notification.questionId!,
                parentId: notification.parentId,
              ),
            ));
        }
        else{
          Navigator
            .of(context)
            .push(MaterialPageRoute(
              builder: (context) => DisplaySolutionPage(
                solutionId: notification.solutionId!,
                parentId: notification.parentId,
              ),
            ));
        }
      }
    );
  }
}