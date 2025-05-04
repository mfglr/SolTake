import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:take_media/pages/take_media_page.dart';
import 'package:take_media_from_gallery/take_media_from_gallery.dart';

class MessageTextField extends StatefulWidget {
  final String hintText;
  final num receiverId;
  final ScrollController scrollController;
  final void Function(Iterable<AppFile> images) addMedias;
  final void Function(String? content) createMessage;
  final bool Function() validateNumberOfMedias;

  const MessageTextField({
    super.key,
    required this.hintText,
    required this.scrollController,
    required this.receiverId,
    required this.addMedias,
    required this.createMessage,
    required this.validateNumberOfMedias
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
                  if(!widget.validateNumberOfMedias()) return;
                  Navigator
                    .of(context)
                    .push(MaterialPageRoute(builder: (context) => const TakeMediaPage()))
                    .then(
                      (media){
                        if(media != null && context.mounted){
                          widget.addMedias([media as AppFile]);
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
                  if(!widget.validateNumberOfMedias()) return;
                  TakeMediaFromGalleryService()
                    .getMedias()
                    .then(
                      (medias){
                        if(medias.isNotEmpty && context.mounted){
                          widget.addMedias(medias);
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
            widget.scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear
            );
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