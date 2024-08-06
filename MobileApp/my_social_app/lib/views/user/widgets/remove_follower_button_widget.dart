import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

class RemoveFollowerButtonWidget extends StatelessWidget {
  
  final UserState user;
  const RemoveFollowerButtonWidget({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Text("Remove")
          ),
          const Icon(Icons.remove)
        ],
      ),
    );
  }
}