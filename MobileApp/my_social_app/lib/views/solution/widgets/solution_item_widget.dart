import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/solution/widgets/downvote_button_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_comment_button_widget.dart';
import 'package:my_social_app/views/solution/widgets/solution_state_widget.dart';
import 'package:my_social_app/views/solution/widgets/upvote_button_widget.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/solution/widgets/solution_images_slider.dart';
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
          Builder(
            builder: (context) {
              if(solution.content != null){
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(solution.content!),
                );
              }
              return const SizedBox.shrink();
            }
          ),
          Row(
            children: [
              Builder(
                builder: (context) {
                  if(!solution.isOwner) return UpvoteButtonWidget(solution: solution);
                  return const SizedBox.shrink();
                }
              ),
              Builder(
                builder: (context) {
                  if(!solution.isOwner)return DownvoteButtonWidget(solution: solution);
                  return const SizedBox.shrink();
                }
              ),
              SolutionCommentButtonWidget(solution: solution)
            ]
          )
        ],
      ),
    );
  }
}