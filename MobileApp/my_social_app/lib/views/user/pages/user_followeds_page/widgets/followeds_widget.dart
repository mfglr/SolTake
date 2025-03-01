import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/user_entity_state/followed_state.dart';
import 'package:my_social_app/views/user/pages/user_followeds_page/widgets/followed_widget.dart';

class FollowedsWidget extends StatelessWidget {
  final Iterable<FollowedState> followeds;
  const FollowedsWidget({
    super.key,
    required this.followeds
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
        followeds
          .mapIndexed(
            (index,e) => 
              index != followeds.length - 1
                ? Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: FollowedWidget(followed: followeds.elementAt(index)),
                  )
                : FollowedWidget(followed: followeds.elementAt(index))
          )
          .toList()
    );
  }
}