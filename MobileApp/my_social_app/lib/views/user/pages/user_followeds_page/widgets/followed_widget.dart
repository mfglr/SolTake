import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_entity_state/followed_state.dart';
import 'package:my_social_app/views/shared/app_avatar/app_avatar.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class FollowedWidget extends StatelessWidget {
  final FollowedState followed;
  const FollowedWidget({
    super.key,
    required this.followed
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: followed.followedId,))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: AppAvatar(
                  avatar: followed,
                  diameter: 55
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    followed.userName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black
                    ),
                  ),
                  if(followed.name != null)
                    Text(
                      followed.name!,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}