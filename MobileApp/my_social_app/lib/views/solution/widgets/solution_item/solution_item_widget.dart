import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/extendable_content/extendable_content.dart';
import 'package:my_social_app/views/solution/widgets/buttons/display_solution_downvotes_button.dart';
import 'package:my_social_app/views/solution/widgets/buttons/display_solution_upvotes_button.dart';
import 'package:my_social_app/views/solution/widgets/buttons/downvote_button.dart';
import 'package:my_social_app/views/solution/widgets/buttons/solution_comment_button.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_popup_menu.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_state_widget.dart';
import 'package:my_social_app/views/solution/widgets/buttons/upvote_button.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/solution/widgets/solution_item/solution_images_slider.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class SolutionItemWidget extends StatelessWidget {
  final SolutionState solution;
  const SolutionItemWidget({super.key,required this.solution});

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
                            userId: solution.appUserId,
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
                        child: UserImageWidget( userId: solution.appUserId, diameter: 45),
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
                    Text(
                      timeago.format(solution.createdAt,locale: 'en_short')
                    ),
                    if(solution.isOwner)
                      SolutionPopupMenu(solution: solution)
                  ],
                )
              ],
            ),
          ),
          Builder(
            builder: (context) {
              if(solution.images.isNotEmpty){
                return SolutionImagesSlider(solution: solution,);
              }
              return const SizedBox.shrink();
            }
          ),
          Padding(
            padding: const EdgeInsets.only(left:12,right: 12,top: 15),
            child: Row(
              children: [
                UpvoteButton(solution: solution),
                DisplaySolutionUpvotesButton(solution: solution),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: DownvoteButton(solution: solution)
                ),
                DisplaySolutionDownvotesButton(solution: solution),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: SolutionCommentButton(solution: solution),
                )
              ]
            ),
          ),
          if(solution.content != null)
            Padding(
              padding: const EdgeInsets.all(15),
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