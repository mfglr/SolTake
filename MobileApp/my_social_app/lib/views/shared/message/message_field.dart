import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {
  final String userName;
  const MessageField({super.key,required this.userName});

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
              hintText: "Say hello to $userName"
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