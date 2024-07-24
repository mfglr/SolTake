import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/pages/user/user_page.dart';
import 'package:my_social_app/views/shared/Buttons/follow_button_widget.dart';
import 'package:my_social_app/views/shared/buttons/remove_follower_button_widget.dart';
import 'package:my_social_app/views/shared/user/user_image_widget.dart';

class UserItemWidget extends StatelessWidget {
  final UserState state;
  final bool removeFollowerButton;

  const UserItemWidget({
    super.key,
    required this.state,
    this.removeFollowerButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(userId: state.id))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: UserImageWidget(userId: state.id, diameter: 60)
                  ),
                  Builder(
                    builder: (context){
                      if(state.name != null){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.formatUserName(10),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              state.formatName(15),
                              style: const TextStyle(fontSize: 12),
                            )
                          ],
                        );
                      }
                      return Text(
                        state.formatUserName(10),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                  )
                ],
              ),
              Builder(
                builder: (context){
                  if(removeFollowerButton && state.isFollower) return RemoveFollowerButtonWidget(state: state);
                  if(state.isFollowed) return FollowButtonWidget(state: state);
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