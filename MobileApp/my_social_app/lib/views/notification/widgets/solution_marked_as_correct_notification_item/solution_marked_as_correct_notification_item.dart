import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';
import 'solution_marked_as_correct_notification_item_texts.dart';

class SolutionMarkedAsCorrectNotificationItem extends StatelessWidget {
  final NotificationState notification;
  
  const SolutionMarkedAsCorrectNotificationItem({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: content[getLanguage(context)]!,
      icon: const Icon(
        Icons.done,
        color: Colors.green,
      ),
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
            )
        ],
      ),
      onPressed: ()
        =>
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => DisplaySolutionPage(solutionId: notification.solutionId!))) 
    );
  }
}