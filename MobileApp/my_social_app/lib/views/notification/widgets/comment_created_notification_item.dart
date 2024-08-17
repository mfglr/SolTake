import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/parent_type.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';

class CommentCreatedNotificationItem extends StatelessWidget {
  
  final NotificationState notification;
  const CommentCreatedNotificationItem({super.key,required this.notification});

  String _getMessage(CommentState comment){
    if(comment.questionId != null){
      return "Your question has been commented on.";
    }
    else if(comment.solutionId != null){
      return "Your solution has been commented on";
    }
    else{
      return "Your comment has been replied";
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,CommentState?>(
      onInit: (store) => store.dispatch(LoadCommentAction(commentId: notification.commentId!)),
      converter: (store) => store.state.commentEntityState.entities[notification.commentId],
      builder: (context,comment){
        if(comment == null) return const LoadingWidget();
        return NotificationItem(
          notification: notification,
          icon: const Icon(
            Icons.comment,
            color: Colors.blue,
          ),
          content:_getMessage(comment),
          onPressed: (){
            if(comment.questionId != null){
              Navigator
                .of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => DisplayQuestionPage(
                      questionId: comment.questionId!,
                      isOpenCommentModal: false,
                    ))
                  );
              return;
            }
            else if(comment.solutionId != null){
              Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => DisplaySolutionPage(solutionId: comment.solutionId!)));
              return;
            }
            else{
              if(notification.parentType == ParentType.question){
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(
                    builder: (context) => DisplayQuestionPage(
                      questionId: notification.parentId!,
                      isOpenCommentModal: true,
                    ),
                  ));
                return;
              }
              else{
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => DisplaySolutionPage(solutionId: notification.parentId!)));
                return;
              }
            }
          }
        );
      }
    );
  }
}