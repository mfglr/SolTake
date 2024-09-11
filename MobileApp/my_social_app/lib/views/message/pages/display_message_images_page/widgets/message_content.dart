import 'package:flutter/material.dart';
import 'package:my_social_app/views/message/pages/display_message_images_page/constants/constants.dart';

class MessageContent extends StatefulWidget {
  final String content;
  const MessageContent({
    super.key,
    required this.content
  });

  @override
  State<MessageContent> createState() => _MessageContentState();
}

class _MessageContentState extends State<MessageContent> {

  String _formatContent() {
    if(_fullContentVisibility) return widget.content;
    return widget.content.length <= maxContentCharacters ? widget.content : widget.content.substring(0, maxContentCharacters - 3);
  }

  bool _fullContentVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      color: Colors.black.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formatContent(),
                      style: const TextStyle(
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if(widget.content.length > maxContentCharacters && !_fullContentVisibility)
                      TextButton(
                        onPressed: () => setState(() { _fullContentVisibility = true;}),
                        child: const Text(
                          "...",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}