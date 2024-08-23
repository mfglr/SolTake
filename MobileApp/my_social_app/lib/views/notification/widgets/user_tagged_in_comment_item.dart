import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/notification/widgets/notification_bottom_text_content.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';

class UserTaggedInCommentItem extends StatelessWidget {
  final NotificationState notification;
  const UserTaggedInCommentItem({super.key,required this.notification});
  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: "You have been tagged in a comment.",
      icon: const Icon(
        Icons.tag,
        color: Colors.orange,
      ),
      bottomContent: StoreConnector<AppState,CommentState?>(
        onInit: (store) => store.dispatch(LoadCommentAction(commentId: notification.commentId!)),
        converter: (store) => store.state.commentEntityState.entities[notification.commentId!],
        builder:(context,comment){
          if(comment == null) return const SpaceSavingWidget();
          return NotificationBottomTextContent(content: comment.content); 
        }
      ),
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