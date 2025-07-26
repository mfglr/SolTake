import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/question/pages/display_user_questions/display_user_questions_page.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/display_user_image_page.dart';
import 'package:my_social_app/views/user/pages/user_followeds_page/user_followeds_page.dart';
import 'package:my_social_app/views/user/pages/user_followers_page/user_followers_page.dart';

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
              AppAvatar(
                avatar: user,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DisplayUserQuestionsPage(userId: user.id))
                      ),
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: TextButton(
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
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                  ),
              
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserFollowedsPage(userId: user.id)));
                    },
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                      minimumSize: WidgetStateProperty.all(const Size(0, 0)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
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
              if(user.biography != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          user.biography!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13
                          ),
                        ),
                      ),
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