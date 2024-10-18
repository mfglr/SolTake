import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_bottom_text_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserTaggedInCommentItem extends StatelessWidget {
  final NotificationState notification;
  const UserTaggedInCommentItem({super.key,required this.notification});
  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: AppLocalizations.of(context)!.user_tagged_in_comment_item_content,
      icon: const Icon(
        Icons.tag,
        color: Colors.orange,
      ),
      bottomContent: NotificationBottomTextContent(content: notification.commentContent!),
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