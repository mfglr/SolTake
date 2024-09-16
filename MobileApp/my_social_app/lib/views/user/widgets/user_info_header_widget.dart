import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/question/pages/display_user_questions_page.dart';
import 'package:my_social_app/views/user/pages/display_user_image_page.dart';
import 'package:my_social_app/views/user/pages/user_followeds_page.dart';
import 'package:my_social_app/views/user/pages/user_followers_page.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserInfoHeaderWidget extends StatelessWidget {
  final UserState user;
  const UserInfoHeaderWidget({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UserImageWidget(
                userId: user.id,
                diameter: 80,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DisplayUserQuestionsPage(userId: user.id))
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          user.numberOfQuestions.toString(),
                          style: const TextStyle(
                            fontSize: 16
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.user_info_header_widget_questions,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                    
                  TextButton(
                    onPressed: () =>
                      Navigator
                        .of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context) => UserFollowersPage(
                              userId: user.id
                            )
                          )
                        ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          user.numberOfFollowers.toString(),
                          style: const TextStyle(
                            fontSize: 16
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.user_info_header_widget_followers,
                          style: const TextStyle(fontSize: 12),
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
                            fontSize: 16
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.user_info_header_widget_followings,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
              if(user.biography != "")
                Text(
                  user.biography,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}