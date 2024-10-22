import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';

class MessageTextField extends StatefulWidget {
  final String hintText;
  final int receiverId;
  final void Function(Iterable<XFile> images) addImages;
  final void Function(String? content) createMessage;
  final bool Function() validateNumberOfImages;

  const MessageTextField({
    super.key,
    required this.hintText,
    required this.receiverId,
    required this.addImages,
    required this.createMessage,
    required this.validateNumberOfImages
  });

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _messageContentController = TextEditingController();
  String? _content;

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
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white
            ),
            
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Colors.grey
              ),
              
              prefixIcon: IconButton(
                onPressed: (){
                  if(!widget.validateNumberOfImages()) return;
                  Navigator
                    .of(context)
                    .pushNamed(takeImageRoute)
                    .then(
                      (image){
                        if(image != null && context.mounted){
                          widget.addImages([image as XFile]);
                        }
                      }
                    );
                },
                icon: const Icon(
                  Icons.add_a_photo_outlined,
                  size: 18,
                  color: Colors.white,
                )
              ),

              suffixIcon: IconButton(
                onPressed: (){
                  if(!widget.validateNumberOfImages()) return;
                  ImagePicker()
                    .pickMultiImage(imageQuality: 100)
                    .then(
                      (images){
                        if(images.isNotEmpty && context.mounted){
                          widget.addImages(images);
                        }
                      }
                    );
                },
                icon: const Icon(
                  Icons.photo_library_outlined,
                  size: 18,
                  color: Colors.white,
                )
              ),
            ),
            onChanged: (value) => setState(() { _content = value; }),
          ),
        ),
        IconButton(
          onPressed: (){
            _messageContentController.clear();
            widget.createMessage(_content);
          },
          icon: const Icon(
            Icons.send,
            color: Colors.white,
          )
        )
      ],
    );
  }
}