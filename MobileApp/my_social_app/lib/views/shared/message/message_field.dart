import 'package:flutter/material.dart';
import 'package:my_social_app/state/create_message_state/actions.dart';
import 'package:my_social_app/state/store.dart';

class MessageField extends StatefulWidget {
  final String userName;
  const MessageField({super.key,required this.userName});

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _messageContentController = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _messageContentController.dispose();
    super.dispose();
  }

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
            focusNode: _focusNode,
            controller: _messageContentController,
            minLines: 1,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: "Say hello to ${widget.userName}"
            ),
            onChanged: (value) => store.dispatch(ChangeMessageContentAction(content: value)),
          ),
        ),
        TextButton(
          onPressed: (){
            store.dispatch(const CreateMessageAction());
            _focusNode.unfocus();
            _messageContentController.clear();
          },
          child: const Icon(Icons.send)
        )
      ],
    );
  }
}