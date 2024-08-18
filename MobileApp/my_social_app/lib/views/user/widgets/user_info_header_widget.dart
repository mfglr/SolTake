import 'package:flutter/material.dart';
import 'package:my_social_app/state/multi_pagination.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/question/pages/display_user_questions_page.dart';
import 'package:my_social_app/views/user/pages/display_user_image_page.dart';
import 'package:my_social_app/views/user/pages/user_followeds_page.dart';
import 'package:my_social_app/views/user/pages/user_followers_page.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class UserInfoHeaderWidget extends StatelessWidget {
  final UserState user;
  const UserInfoHeaderWidget({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserImageWidget(
                userId: user.id,
                diameter: 100,
                onPressed: () => Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => DisplayUserImagePage(userId: user.id))),
              ),
              Text(
                style: const TextStyle( fontWeight: FontWeight.bold ),
                user.formatName(10)
              ),
            ]
          ),
        ),
        
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DisplayUserQuestionsPage(
                      questionOffset: MultiPagination.defaultPaginationOffset,
                      userId: user.id
                    )
                  )
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user.numberOfQuestions.toString(),
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    const Text(
                      "Questions",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
                
              TextButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserFollowersPage(userId: user.id)));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user.numberOfFollowers.toString(),
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    const Text(
                      "Followers",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
          
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserFollowedsPage(userId: user.id)));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user.numberOfFolloweds.toString(),
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    const Text(
                      "Followings",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}