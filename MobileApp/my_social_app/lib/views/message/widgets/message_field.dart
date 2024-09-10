import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/create_message_state/actions.dart';
import 'package:my_social_app/state/app_state/store.dart';

enum MessageFieldType{
  forConversation,
  forDisplayMessageImages
}

class MessageField extends StatefulWidget {
  final MessageFieldType type;
  final String hintText;
  final ScrollController? scrollController;

  const MessageField({
    super.key,
    required this.hintText,
    required this.type,
    this.scrollController
  });

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _messageContentController = TextEditingController();
  late final Color? color;

  @override
  void initState() {
    color = widget.type == MessageFieldType.forDisplayMessageImages ? Colors.white : null;
    super.initState();
  }

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
        Expanded(
          child: TextField(
            focusNode: _focusNode,
            controller: _messageContentController,
            minLines: 1,
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
              color: color
            ),
            
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
              hintText: widget.hintText,
              prefixIcon: IconButton(
                onPressed: (){
                  _messageContentController.clear();
                  if(widget.type == MessageFieldType.forConversation){
                    store.dispatch(const ClearMessageContentAndImagesAction());
                  }
                  Navigator.of(context).pushNamed(takeMessageImageRoute);
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 18,
                  color: color
                )
              ),
              suffixIcon: IconButton(
                onPressed: (){
                  _messageContentController.clear();
                  if(widget.type == MessageFieldType.forConversation){
                    store.dispatch(const ClearMessageContentAndImagesAction());
                  }

                  ImagePicker()
                    .pickMultiImage(imageQuality: 100)
                    .then(
                      (images){
                        store.dispatch(CreateMessageImagesAction(images: images));
                        if(images.isNotEmpty && widget.type == MessageFieldType.forConversation){
                          Navigator.of(context).pushNamed(displayMessageImagesRoute);
                        }
                      }
                    );
                },
                icon: Icon(
                  Icons.photo_outlined,
                  size: 18,
                  color: color
                )
              ),
            ),
            onChanged: (value) => store.dispatch(ChangeMessageContentAction(content: value)),
          ),
        ),
        IconButton(
          onPressed: (){
            if(widget.type == MessageFieldType.forConversation){
              store.dispatch(const CreateMessageAction());
              widget.scrollController!.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear
              );
            }
            else{
              store.dispatch(const CreateMessageWithImagesAction());
              Navigator.of(context).pop();
            }
            _focusNode.unfocus();
            _messageContentController.clear();
          },
          icon: Icon(
            Icons.send,
            color: color
          )
        )
      ],
    );
  }
}