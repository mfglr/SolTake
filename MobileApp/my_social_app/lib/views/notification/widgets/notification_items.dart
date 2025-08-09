import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/notifications_state.dart/notification_type.dart';
import 'package:my_social_app/views/notification/widgets/comment_replied_notification/comment_replied_notification.dart';
import 'package:my_social_app/views/notification/widgets/question_comment_created_notification_item/question_comment_created_notification_item.dart';
import 'package:my_social_app/views/notification/widgets/comment_liked_notification_item/comment_liked_notification_item.dart';
import 'package:my_social_app/views/notification/widgets/question_liked_notification_item/question_liked_notification_item.dart';
import 'package:my_social_app/views/notification/widgets/solution_comment_created_notification_item/solution_comment_created_notification_item.dart';
import 'package:my_social_app/views/notification/widgets/solution_created_notification_item/solution_created_notification_item.dart';
import 'package:my_social_app/views/notification/widgets/solution_marked_as_correct_notification_item/solution_marked_as_correct_notification_item.dart';
import 'package:my_social_app/views/notification/widgets/solution_marked_as_incorrect_notification_item/solution_marked_as_incorrect_notification_item.dart';
import 'package:my_social_app/views/notification/widgets/solution_voted_notification_item/solution_voted_notification_item.dart';
import 'package:my_social_app/views/notification/widgets/user_followed_notification_item/user_followed_notification_item.dart';
import 'package:my_social_app/views/notification/widgets/user_tagged_in_comment_notification_item/user_tagged_in_comment_item.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';

class NotificationItems extends StatelessWidget {
  final Iterable<NotificationState> notifications;

  const NotificationItems({super.key,required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: notifications.mapIndexed(
        (index,e) => Container(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context){
              final notification = notifications.elementAt(index);
              switch(notification.type){
                case NotificationType.questionCommentCreatedNotification :
                  return QuestionCommentCreatedNotificationItem(notification: notification);
                case NotificationType.solutionCommentCreatedNotification :
                  return SolutionCommentCreatedNotificationItem(notification: notification);
                case NotificationType.commentRepliedNotification :
                  return CommentRepliedNotification(notification: notification);
                case NotificationType.questionLikedNotification :
                  return QuestionLikedNotificationItem(notification: notification);
                case NotificationType.commentLikedNotification :
                  return CommentLikedNotificationItem(notification: notification);
                case NotificationType.solutionCreatedNotification:
                  return SolutionCreatedNotificationItem(notification: notification);
                case NotificationType.userTaggedInCommentNotifcation:
                  return UserTaggedInCommentItem(notification: notification);
                case NotificationType.userFollowedNotification:
                  return UserFollowedNotificationItem(notification: notification);
                case NotificationType.solutionMarkedAsIncorrectNotification:
                  return SolutionMarkedAsIncorrectNotificationItem(notification: notification);
                case NotificationType.solutionMarkedAsCorrectNotification:
                  return SolutionMarkedAsCorrectNotificationItem(notification: notification);
                case NotificationType.solutionVotedNotification:
                  return SolutionVotedNotificationItem(notification: notification);
                default :
                  return const SpaceSavingWidget();
              }
            }
          ),
        )
      ).toList()
    );
  }
}