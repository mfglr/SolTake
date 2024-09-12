import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/message/pages/display_message_images_page/display_message_images_page.dart';
import 'package:my_social_app/views/shared/loading_widget.dart';

class MessageImageGridWidget extends StatefulWidget {
  final MessageImageState messageImage;
  final Iterable<int> selectedMessageIds;
  final void Function(int messageId) onPressMessageItem;

  const MessageImageGridWidget({
    super.key,
    required this.messageImage,
    required this.selectedMessageIds,
    required this.onPressMessageItem
  });

  @override
  State<MessageImageGridWidget> createState() => _MessageImageGridWidgetState();
}

class _MessageImageGridWidgetState extends State<MessageImageGridWidget> {
  @override
  void initState() {
    store.dispatch(LoadMessageImageAction(messageId: widget.messageImage.messageId,index: widget.messageImage.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.selectedMessageIds.isEmpty){
          Navigator
            .of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => DisplayMessageImagesPage(
                  messageId:widget.messageImage.messageId,
                  activeIndex: widget.messageImage.index,
                )
              )
            );
        }
        else{
          widget.onPressMessageItem(widget.messageImage.messageId);
        }
      },
      child: Builder(
        builder: (context){
          if(widget.messageImage.image == null) return const LoadingWidget();
          return Image.memory(
            key: ValueKey(widget.key),
            widget.messageImage.image!,
            fit: BoxFit.cover,
          );
        }
      ),
    );
  }
}