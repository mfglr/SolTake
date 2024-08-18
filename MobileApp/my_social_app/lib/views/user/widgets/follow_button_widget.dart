import 'package:flutter/material.dart';
import 'package:my_social_app/state/store.dart';
import 'package:my_social_app/state/user_entity_state/actions.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

class FollowButtonWidget extends StatelessWidget {
  final UserState user;
  const FollowButtonWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        if(user.isFollowed){
          store.dispatch(UnfollowAction(followedId: user.id));
        }
        else{
          store.dispatch(FollowAction(followedId: user.id));
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(user.isFollowed ? "Unfollow" : "Follow")
          ),
          Icon(user.isFollowed ? Icons.person_remove : Icons.person_add)
        ],
      )
    );
  }
}