import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/views/loading_widget.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentCreatedNotificationItem extends StatelessWidget {
  
  final NotificationState notification;

  const CommentCreatedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
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
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: UserImageWidget(
                            userId: comment.appUserId,
                            diameter: 45
                          ),
                        ),
                        Expanded(
                          child: Wrap(
                            children: [
                              Builder(
                                builder: (context){
                                  if(comment.questionId != null){
                                    return Text("${comment.userName} comment on your question.");
                                  }
                                  else if(comment.solutionId != null){
                                    return Text("${comment.userName} comment on your solution.");
                                  }
                                  else{
                                    return Text("${comment.userName} reply to your comment.");
                                  }
                                }
                              ),
                            ],
                          ),
                        ),
                    
                      ],
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
}