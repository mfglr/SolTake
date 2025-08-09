import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/notification/widgets/solution_created_notification_item/solution_created_notification_item_texts.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';

class SolutionCreatedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const SolutionCreatedNotificationItem({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: content[getLanguage(context)]!,
      onPressed: () 
        => 
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => DisplaySolutionPage(solutionId: notification.solutionId!))),
      icon: const Icon(
        Icons.lightbulb,
        color: Colors.yellow,
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
    );
  }
}