import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/shared/user/user_item_widget.dart';

class UserItemsWidget extends StatelessWidget {
  final List<UserState> state;
  final bool removeFollowerButton;
  const UserItemsWidget({super.key,required this.state,this.removeFollowerButton = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: UserItemWidget(state: state[index],removeFollowerButton: removeFollowerButton,)
        );
      }
    );
  }
}