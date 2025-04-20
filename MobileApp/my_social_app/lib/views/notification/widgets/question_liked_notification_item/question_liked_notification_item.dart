import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/notification/widgets/question_liked_notification_item/question_liked_notification_item_texts.dart';
import 'package:my_social_app/views/question/pages/display_question_page/display_question_page.dart';

class QuestionLikedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const QuestionLikedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      onPressed: ()
        => 
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => DisplayQuestionPage(questionId: notification.questionId!))),
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,  
      ),
      content: contents[getLanguage(context)]!,
      bottomContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MultimediaGrid(
            state: notification.questionMedia,
            noMediaPath: noMediaAssetPath, 
            notFoundMediaPath: noMediaAssetPath
          ),
          if(notification.questionContent != null)
            Text(
              compressText(notification.questionContent!, 20),
              style: const TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ), 
            )
        ],
      ),
    );
  }
}