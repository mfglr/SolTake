import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/users_state/follow_state.dart';
import 'package:my_social_app/views/shared/user_item/user_item_widget.dart';
import 'package:my_social_app/views/shared/app_column.dart';
import 'package:my_social_app/views/user/pages/user_page/pages/user_page/user_page.dart';

class FollowsWidget extends StatelessWidget {
  final Iterable<FollowState> follows;
  final Widget Function(FollowState)? rightWidget;
  const FollowsWidget({
    super.key,
    this.rightWidget,
    required this.follows
  });

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: 
        follows.map((e) => UserItemWidget(
          userItem: e,
          rightWidget: rightWidget != null ? rightWidget!(e) : null,
          onPressed: () =>
            Navigator
              .of(context)
              .push(MaterialPageRoute(builder: (context) => UserPage(userId: e.userId))),
        ))
    );
  }
}