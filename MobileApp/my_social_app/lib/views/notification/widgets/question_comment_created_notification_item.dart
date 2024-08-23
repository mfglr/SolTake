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
      bottomContent: StoreConnector<AppState,CommentState?>(
        onInit: (store) => store.dispatch(LoadCommentAction(commentId: notification.commentId!)),
        converter: (store) => store.state.commentEntityState.entities[notification.commentId!],
        builder:(context,comment){
          if(comment == null) return const SpaceSavingWidget();
          return NotificationBottomTextContent(content: comment.content); 
        }
      ),
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