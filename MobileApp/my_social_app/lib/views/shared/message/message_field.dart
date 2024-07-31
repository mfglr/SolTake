import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_entity_state/user_state.dart';

class MessageField extends StatelessWidget {
  final UserState user;
  const MessageField({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: (){},
          style: const ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
          icon: const Icon(Icons.camera_alt)
        ),
        Expanded(
          child: TextField(
            minLines: 1,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: "Say hello to ${user.userName}"
            ),
          ),
        ),
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.send)
        )
      ],
    );
  }
}