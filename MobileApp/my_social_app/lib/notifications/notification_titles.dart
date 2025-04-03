import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_type.dart';

const Map<int,Map<String,String>> notificationTitles = {
  NotificationType.commentLikedNotification :
  {
    "en": "New Like",
    "tr": "Yeni Beğeni"
  },
  NotificationType.commentRepliedNotification:
  {
    "en": "New Comment",
    "tr": "Yeni Yorum"
  },
  NotificationType.questionCommentCreatedNotification : 
  { 
    "en": "New Comment",
    "tr": "Yeni Yorum"
  },
  NotificationType.questionLikedNotification:
  {
    "en": "New Like",
    "tr": "Yeni beğeni"
  },
  NotificationType.solutionCommentCreatedNotification:
  {
    "en": "New Comment",
    "tr": "Yeni Yorum"
  },
  NotificationType.solutionCreatedNotification:
  {
    "en": "New Solution",
    "tr": "Yeni Çözüm"
  },
  NotificationType.solutionMarkedAsCorrectNotification:
  {
    "en": "New Correct Solution",
    "tr": "Yeni Doğru Çözüm"
  },
  NotificationType.solutionMarkedAsIncorrectNotification:
  {
    "en": "New Incorrect Solution",
    "tr": "Yeni Yanlış Çözüm"
  },
  NotificationType.userFollowedNotification:
  {
    "en": "New Follower",
    "tr": "Yeni Takipçi"
  },
  NotificationType.userTaggedInCommentNotifcation:
  {
    "en": "New Tag",
    "tr": "Yeni Etiket"
  }
};