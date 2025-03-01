import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follower_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/user_followers_page/widgets/remove_follower_widget.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class FollowerWidget extends StatelessWidget {
  final FollowerState follower;
  const FollowerWidget({
    super.key,
    required this.follower
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: follower.followerId,))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: AppAvatar(
                      avatar: follower,
                      diameter: 55
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        follower.userName,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black
                        ),
                      ),
                      if(follower.name != null)
                        Text(
                          follower.name!,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        )
                    ],
                  )
                ],
              ),
              RemoveFollowerWidget(follower: follower)
            ],
          ),
        ),
      ),
    );
  }
}