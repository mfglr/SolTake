import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_type.dart';

const Map<int,Map<String,String>> notificationBodies = {
  NotificationType.commentLikedNotification :
  {
    "en": "Your comment has been liked.",
    "tr": "Yorumun beğenildi."
  },
  NotificationType.commentRepliedNotification:
  {
    "en": "Your comment has been replied.",
    "tr": "Yorumuna yanıt geldi."
  },
  NotificationType.questionCommentCreatedNotification : 
  { 
    "en": "Your question has been commented.",
    "tr": "Soruna yorum yapıldı."
  },
  NotificationType.questionLikedNotification:
  {
    "en": "Your question has been liked.",
    "tr": "Sorun beğenildi."
  },
 
  NotificationType.solutionCommentCreatedNotification:
  {
    "en": "Your solution has been commented",
    "tr": "Çözümüne yorum yapıldı."
  },
  NotificationType.solutionCreatedNotification:
  {
    "en": "A solution has been created for your question.😊👊 Click to check the solution.",
    "tr": "Sorun için bir çözüm oluşturuldu!😊👊 Çözümü kontrol etmek için tıklayın."
  },
  NotificationType.solutionMarkedAsCorrectNotification:
  {
    "en": "Your solution has been marked as correct.👏👏👏",
    "tr": "Çözümün doğru olarak işaretlendi.👏👏👏"
  },
  NotificationType.solutionMarkedAsIncorrectNotification:
  {
    "en": "Your solution has been marked as incorrect!😓",
    "tr": "Çözümün yanlış olarak işaretlendi!😓"
  },
  NotificationType.userFollowedNotification:
  {
    "en": "You have a new follower.",
    "tr": "Yeni takipçin var."
  },
  NotificationType.userTaggedInCommentNotifcation:
  {
    "en": "You have been tagged in a comment.",
    "tr": "Bir yoruma etiketlendin."
  }
};