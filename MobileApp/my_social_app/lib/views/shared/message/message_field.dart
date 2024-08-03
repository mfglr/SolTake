import 'package:flutter/material.dart';
import 'package:my_social_app/state/create_message_state/actions.dart';
import 'package:my_social_app/state/store.dart';

class MessageField extends StatelessWidget {
  final String userName;
  const MessageField({super.key,required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: (){},
          style: const ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
          child: const Icon(Icons.camera_alt)
        ),
        Expanded(
          child: TextField(
            minLines: 1,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: "Say hello to $userName"
            ),
            onChanged: (value) => store.dispatch(ChangeMessageContentAction(content: value)),
          ),
        ),
        TextButton(
          onPressed: () => store.dispatch(const CreateMessageAction()),
          child: const Icon(Icons.send)
        )
      ],
    );
  }
}