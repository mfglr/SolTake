import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_bottom_comment_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';

class CommentLikedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const CommentLikedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: "Your comment has been liked.",
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      bottomContent: NotificationBottomCommentContent(content: notification.content!),
      onPressed: (){
        if(notification.parentId != null){
          if(notification.questionId != null){
            Navigator
              .of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => DisplayQuestionPage(
                    questionId: notification.questionId!,
                    parentId: notification.parentId,
                  )
                )
              );
          }
          else{
            Navigator
              .of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => DisplaySolutionPage(
                    solutionId: notification.solutionId!,
                    parentId: notification.parentId,
                  )
                )
              );
          }
        }
        else if(notification.questionId != null){
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => DisplayQuestionPage(
                  questionId: notification.questionId!,
                  parentId: notification.commentId,
                )
              )
            );
        }
        else{
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => DisplaySolutionPage(
                  solutionId: notification.solutionId!,
                  parentId: notification.commentId,
                )
              )
            );
        }
      }
    );
  }
}