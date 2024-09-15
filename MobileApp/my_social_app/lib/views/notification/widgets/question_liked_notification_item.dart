import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/question/pages/display_question_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuestionLikedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const QuestionLikedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      onPressed: () => 
        Navigator
          .of(context)
          .push( MaterialPageRoute(
            builder: (context) => DisplayQuestionPage(
              questionId: notification.questionId!,
            )
          )),
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,  
      ),
      content: AppLocalizations.of(context)!.question_liked_notification_item_content,
    );
  }
}