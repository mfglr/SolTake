import 'package:flutter/material.dart';
import 'package:my_social_app/models/states/user_state.dart';
import 'package:my_social_app/views/shared/user/user_item_widget.dart';

class UserItemsWidget extends StatelessWidget {
  final List<UserState> state;
  
  const UserItemsWidget({super.key,required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: UserItemWidget(state: state[index])
        );
      }
    );
  }
}