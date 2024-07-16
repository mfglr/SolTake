import 'package:flutter/material.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/views/shared/question/question_images_slider.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;



class QuestionItemWidget extends StatelessWidget {
  final QuestionState question;
  const QuestionItemWidget({super.key,required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pushNamed(userPageRoute,arguments: question.appUserId),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: UserImageWidget(
                        userId: question.appUserId,
                        diameter: 45
                      ),
                    ),
                    Text(question.formatUserName(10))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: Text(
                  timeago.format(
                    question.createdAt,
                    locale: 'en_short'
                  )
                )
              )
            ],
          ),
          QuestionImagesSlider(question: question,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.favorite_outline)
                  ),
                  const Text("123"),
                  
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.mode_comment_outlined)
                  ),
                  const Text("56")
                ],
              ),
              
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.border_color_outlined)
                  ),
                ],
              )
            ],
          ),
          
        ],
      ),
    );
  }
}