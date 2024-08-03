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
        IconButton(
          onPressed: (){
          },
          style: const ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder())),
          icon: const Icon(Icons.camera_alt)
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
        IconButton(
          onPressed: () => store.dispatch(),
          icon: const Icon(Icons.send)
        )
      ],
    );
  }
}