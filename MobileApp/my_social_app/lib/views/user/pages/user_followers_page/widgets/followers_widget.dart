import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_entity_state/follower_state.dart';
import 'package:my_social_app/views/user/pages/user_followers_page/widgets/follower_widget.dart';

class FollowersWidget extends StatelessWidget {
  final Iterable<FollowerState> followers;
  const FollowersWidget({
    super.key,
    required this.followers
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
        followers
          .mapIndexed(
            (index,e) => 
              index != followers.length - 1
                ? Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: FollowerWidget(follower: followers.elementAt(index)),
                  )
                : FollowerWidget(follower: followers.elementAt(index))
          )
          .toList()
    );
  }
}