import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:my_social_app/views/user/widgets/follow_button_widget.dart';
import 'package:my_social_app/views/user/widgets/remove_follower_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_image_widget.dart';

class UserItemWidget extends StatelessWidget {
  final UserState user;
  final bool removeFollowerButton;

  const UserItemWidget({
    super.key,
    required this.user,
    this.removeFollowerButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: user.id))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: UserImageWidget(userId: user.id, diameter: 60)
                  ),
                  Builder(
                    builder: (context){
                      if(user.name != null){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              user.formatUserName(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              user.formatName(15),
                              style: const TextStyle(fontSize: 12),
                            )
                          ],
                        );
                      }
                      return Text(
                        user.formatUserName(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                  )
                ],
              ),
              Builder(
                builder: (context){
                  if(removeFollowerButton && user.isFollower) return RemoveFollowerButtonWidget(user: user);
                  if(user.isFollowed) return FollowButtonWidget(user: user);
                  return const Text("");
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}