import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/shared/solution/approve_solution_button_widget.dart';
import 'package:my_social_app/views/shared/solution/downvote_button_widget.dart';
import 'package:my_social_app/views/shared/solution/solution_images_slider.dart';
import 'package:my_social_app/views/shared/solution/upvote_button_widget.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class SolutionItemWidget extends StatelessWidget {
  final SolutionState solution;
  const SolutionItemWidget({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(userPageRoute,arguments: solution.appUserId),
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
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: Text(
                  timeago.format(solution.createdAt,locale: 'en_short')
                )
              )
            ],
          ),
          SolutionImagesSlider(solution: solution,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  UpvoteButtonWidget(solution: solution),
                  DownvoteButtonWidget(solution: solution),
                ],
              ),
              ApproveSolutionButtonWidget(solution: solution)
            ],
          )
        ],
      ),
    );
  }
}