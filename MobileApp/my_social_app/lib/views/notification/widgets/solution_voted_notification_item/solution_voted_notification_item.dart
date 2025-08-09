import 'package:flutter/material.dart';
import 'package:multimedia_grid/multimedia_grid.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/helpers/string_helpers.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/notifications_state.dart/notification_state.dart';
import 'package:my_social_app/state/app_state/solution_votes_state/solution_vote_type.dart';
import 'package:my_social_app/views/notification/widgets/notification_item.dart';
import 'package:my_social_app/views/notification/widgets/solution_voted_notification_item/solution_voted_notification_item_texts.dart';
import 'package:my_social_app/views/solution/pages/display_solution_page.dart';

class SolutionVotedNotificationItem extends StatelessWidget {
  final NotificationState notification;
  const SolutionVotedNotificationItem({
    super.key,
    required this.notification
  });

  @override
  Widget build(BuildContext context) {
    return NotificationItem(
      notification: notification,
      content: 
        notification.solutionVoteType == SolutionVoteType.upvote
          ? contentUpvote[getLanguage(context)]!
          : contentDownvote[getLanguage(context)]!,
      icon: Icon(
        notification.solutionVoteType == SolutionVoteType.upvote
          ? Icons.thumb_up
          : Icons.thumb_down,
        color: notification.solutionVoteType == SolutionVoteType.upvote
          ? Colors.green
          : Colors.red,
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