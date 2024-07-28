import 'package:flutter/material.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/solution/solution_buttons_widget.dart';
import 'package:my_social_app/views/shared/solution/solution_images_slider.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class SolutionItemWidget extends StatelessWidget {
  final SolutionState solution;
  const SolutionItemWidget({super.key,required this.solution});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: solution.appUserId,userName: null,))),
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
                  Text(
                    timeago.format(solution.createdAt,locale: 'en_short')
                  ),
                  Builder(
                    builder: (context){
                      if(solution.isOwner){
                        return IconButton(
                          onPressed: (){
                          },
                          icon: const Icon(Icons.more_vert)
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              )
            ],
          ),
          SolutionImagesSlider(solution: solution,),
          SolutionButtonsWidget(solution: solution,),
        ],
      ),
    );
  }
}