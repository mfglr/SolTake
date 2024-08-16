import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_header_widget.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentCreatedNotificationItem extends StatelessWidget {
  
  final NotificationState notification;
  const CommentCreatedNotificationItem({super.key,required this.notification});

  String _getMessage(CommentState comment){
    if(comment.questionId != null){
      return "commented on your question.";
    }
    else if(comment.solutionId != null){
      return "commented on your solution.";
    }
    else{
      return "replied your comment.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserState?>(
      onInit: (store) => store.dispatch(LoadUserAction(userId: notification.userId!)),
      converter: (store) => store.state.userEntityState.entities[notification.userId!],
      builder: (context,user){
        if(user == null) return const LoadingWidget();
        return StoreConnector<AppState,CommentState?>(
          onInit: (store) => store.dispatch(LoadCommentAction(commentId: notification.commentId!)),
          converter: (store) => store.state.commentEntityState.entities[notification.commentId],
          builder: (context,comment) => Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Builder(
                builder: (context) {
                  if(comment != null){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NotificationHeaderWidget(
                          user: user,
                          notification: notification,
                          message: _getMessage(comment)
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            comment.formatContent,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:15,left: 5),
                              child: Text(
                                timeago.format(notification.createdAt,locale: 'en_short')
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }
                  return const LoadingWidget();
                }
              ),
            ),
          ),
        );
      }
    );
  }
}