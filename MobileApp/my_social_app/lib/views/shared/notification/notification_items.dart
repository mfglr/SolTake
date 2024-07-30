import 'package:flutter/material.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/state/notification_entity_state.dart/notification_type.dart';
import 'package:my_social_app/views/shared/notification/comment_created_notification_item.dart';
import 'package:my_social_app/views/shared/notification/comment_liked_notification_item.dart';
import 'package:my_social_app/views/shared/notification/question_liked_notification_item.dart';

class NotificationItems extends StatelessWidget {
  final Iterable<NotificationState> notifications;

  const NotificationItems({super.key,required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        notifications.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context){
                final notification = notifications.elementAt(index);
                switch(notification.type){
                  case NotificationType.commentCreatedNotification :
                    return CommentCreatedNotificationItem(notification: notification);
                  case NotificationType.questionLikedNotification :
                    return QuestionLikedNotificationItem(notification: notification);
                  case NotificationType.commentLikedNotification :
                    return CommentLikedNotificationItem(notification: notification);
                }
                return Container();
              }
            ),
          );
        } 
      )
    );
  }
}