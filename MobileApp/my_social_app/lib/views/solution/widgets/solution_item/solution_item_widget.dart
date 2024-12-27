import 'package:flutter/material.dart';
import 'package:multimedia_slider/multimedia_slider.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/app_date_widget.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/display_solution_downvotes_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/display_solution_upvotes_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/downvote_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/save_solution_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_comment_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_popup_menu.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_state_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/upvote_button.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class SolutionItemWidget extends StatelessWidget {
  final SolutionState solution;

  const SolutionItemWidget({
    super.key,
    required this.solution,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(solution.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => 
                    Navigator
                      .of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => UserPage(
                            userId: solution.userId,
                            userName: null
                          )
                        )
                      ),
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: UserImageWidget( userId: solution.userId, diameter: 45),
                      ),
                      Text(solution.formatUserName(10))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: SolutionStateWidget(solution: solution),
                    ),
                    AppDateWidget(
                      dateTime: solution.createdAt,
                      style: const TextStyle(fontSize: 11),
                    ),
                    if(solution.isOwner)
                      SolutionPopupMenu(solution: solution)
                  ],
                )
              ],
            ),
          ),
          MultimediaSlider(
            medias: solution.medias,
            blobServiceUrl: AppClient.blobService,
            notFoundMediaPath: noMediaAssetPath,
            noMediaPath: noMediaAssetPath,
            headers: AppClient().getHeader(),
          ),
          Padding(
            padding: const EdgeInsets.only(left:12,right: 12,top: 15,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UpvoteButton(solution: solution),
                    if(solution.numberOfUpvotes > 0)
                      DisplaySolutionUpvotesButton(solution: solution),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: DownvoteButton(solution: solution)
                    ),
                    if(solution.numberOfDownvotes > 0)
                      DisplaySolutionDownvotesButton(solution: solution),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: SolutionCommentButton(solution: solution),
                    )
                  ]
                ),
                SaveSolutionButton(solution: solution)
              ],
            ),
          ),
          if(solution.content != null)
            Padding(
              padding: const EdgeInsets.only(left:12, right: 12, bottom: 15),
              child: ExtendableContent(
                content: solution.content!,
                numberOfExtention: 25,
              ),
            ),
        ],
      ),
    );
  }
}