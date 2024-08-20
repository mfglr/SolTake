import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_bottom_comment_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';

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
      content: "Your comment has been replied",
      icon: const Icon(
        Icons.reply,
        color: Colors.green,
      ),
      bottomContent: NotificationBottomCommentContent(content: notification.content!),
      onPressed: (){
        if(notification.questionId != null){
          Navigator
            .of(context)
            .push(MaterialPageRoute(
              builder: (context) => DisplayQuestionPage(
                questionId: notification.questionId!,
                parentId: notification.parentId,
                commentId: notification.commentId,
                repliedId: notification.repliedId,
              ),
            ));
        }
      }
    );
  }
}