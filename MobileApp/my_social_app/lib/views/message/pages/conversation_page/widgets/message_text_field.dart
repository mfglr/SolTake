import 'dart:async';
import 'package:app_file/app_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/routes.dart';
import 'package:my_social_app/services/message_hub.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/pages/create_message_medias_page/create_message_medias_page.dart';
import 'package:rxdart/rxdart.dart';
import 'package:take_media_from_gallery/take_media_from_gallery.dart';

class MessageTextField extends StatefulWidget {
  final String hintText;
  final ScrollController scrollController;
  final int receiverId;

  const MessageTextField({
    super.key,
    required this.hintText,
    required this.receiverId,
    required this.scrollController
  });

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _messageContentController = TextEditingController();
  final BehaviorSubject<String> _subject = BehaviorSubject();
  late final StreamSubscription<String> _subscription;

  @override
  void initState() {
    _subscription = _subject
      .debounceTime(const Duration(milliseconds: 500))
      .listen((_) => MessageHub().changeStateToFocused(widget.receiverId));
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
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
            onChanged: (value){
              _subject.add(value);
              MessageHub().changeStateToTyping(widget.receiverId);
            },

            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
              hintText: widget.hintText,
              
              prefixIcon: IconButton(
                onPressed: (){
                  _messageContentController.clear();
                  Navigator
                    .of(context)
                    .pushNamed(takeMediaRoute)
                    .then(
                      (media){
                        if(media != null && context.mounted){
                          Navigator
                            .of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => CreateMessageMediasPage(
                                  medias: [media as AppFile],
                                  receiverId: widget.receiverId,
                                  scrollController: widget.scrollController,
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
                  _messageContentController.text = "";
                  _messageContentController.clear();
                  TakeMediaFromGalleryService()
                    .getMedias()
                    .then(
                      (medias){
                        if(medias.isNotEmpty && context.mounted){
                          Navigator
                            .of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => CreateMessageMediasPage(
                                  medias: medias,
                                  receiverId: widget.receiverId,
                                  scrollController: widget.scrollController,
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
            )
          ),
        ),
        IconButton(
          onPressed: _messageContentController.text == ""
            ? null 
            : (){
                widget.scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear
                );
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(CreateMessageAction(receiverId: widget.receiverId,content: _messageContentController.text));
                _messageContentController.clear();
              },
          icon: const Icon(
            Icons.send,
          )
        )
      ],
    );
  }
}