import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

class SingleMessageImageWidget extends StatefulWidget {
  final MessageImageState messageImage;
  const SingleMessageImageWidget({super.key,required this.messageImage});
  @override
  State<SingleMessageImageWidget> createState() => _MessageImageWidgetState();
}

class _MessageImageWidgetState extends State<SingleMessageImageWidget> {
  @override
  void initState() {
    store.dispatch(
      LoadMessageImageAction(
        messageId: widget.messageImage.messageId,
        messageImageId: widget.messageImage.id
      )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.messageImage.image == null){
      return LayoutBuilder(
        builder: (context,constraints) => SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxWidth * widget.messageImage.height / widget.messageImage.width,
          child: const LoadingView()
        ),
      );
    }
    return Image.memory(widget.messageImage.image!); 
  }
}