import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/notification/widgets/solution_comment_created_notification_item/solution_comment_created_notification_item_texts.dart' show content;
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';

class SolutionCommentCreatedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const SolutionCommentCreatedNotificationItem({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: content[getLanguage(context)]!,
      icon: const Icon(
        Icons.comment,
        color: Colors.blue,
      ),
      onPressed: () 
        => 
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => DisplaySolutionPage(solutionId: notification.solutionId!))),
      bottomContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MultimediaGrid(
            state: notification.solutionMedia,
            blobServiceUrl: AppClient.blobService, 
            noMediaPath: noMediaAssetPath, 
            notFoundMediaPath: noMediaAssetPath
          ),
          if(notification.solutionContent != null)
            Text(
              compressText(notification.solutionContent!, 20),
              style: const TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.black
              ), 
            ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Text(
              "\"${notification.commentContent!}\"",
              style: const TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}