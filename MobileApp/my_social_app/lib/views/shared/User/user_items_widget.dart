import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/user/user_item_widget.dart';

class UserItemsWidget extends StatelessWidget {
  final Iterable<UserState> users;
  final bool removeFollowerButton;
  const UserItemsWidget({super.key,required this.users,this.removeFollowerButton = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: UserItemWidget(user: users.elementAt(index),removeFollowerButton: removeFollowerButton,)
        );
      }
    );
  }
}