import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/pages/create_message_images_page/create_message_images_page.dart';

class MessageTextField extends StatefulWidget {
  final String hintText;
  final ScrollController? scrollController;
  final int receiverId;

  const MessageTextField({
    super.key,
    required this.hintText,
    required this.receiverId,
    this.scrollController
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
            ),
            
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
              hintText: widget.hintText,
              
              prefixIcon: IconButton(
                onPressed: (){
                  _messageContentController.clear();
                  Navigator
                    .of(context)
                    .pushNamed(takeImageRoute)
                    .then(
                      (image){
                        if(image != null && context.mounted){
                          Navigator
                            .of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => CreateMessageImagesPage(
                                  images: [image as XFile],
                                  receiverId: widget.receiverId,
                                )
                              )
                            );
                        }
                      }
                    );
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 18,
                )
              ),

              suffixIcon: IconButton(
                onPressed: (){
                  _messageContentController.clear();
                  ImagePicker()
                    .pickMultiImage(imageQuality: 100)
                    .then(
                      (images){
                        if(images.isNotEmpty && context.mounted){
                          Navigator
                            .of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => CreateMessageImagesPage(
                                  images: images,
                                  receiverId: widget.receiverId,
                                )
                              )
                            );
                        }
                      }
                    );
                },

                icon: const Icon(
                  Icons.photo_outlined,
                  size: 18,
                )
              ),
            ),
            onChanged: (value) => setState(() { _content = value; }),
          ),
        ),
        IconButton(
          onPressed: _content == null 
            ? null 
            : (){
                widget.scrollController!.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear
                );
                _messageContentController.clear();

                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(CreateMessageAction(receiverId: widget.receiverId,content: _content!));
              },
          icon: const Icon(
            Icons.send,
          )
        )
      ],
    );
  }
}