import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/message/pages/display_message_images_page/widgets/message_content.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/display_image_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';

class DisplayMessageImagesPage extends StatefulWidget {

  static const int maxContentCharacters = 120;
  final int messageId;
  
  const DisplayMessageImagesPage({
    super.key,
    required this.messageId
  });

  @override
  State<DisplayMessageImagesPage> createState() => _DisplayMessageImagesPageState();
}

class _DisplayMessageImagesPageState extends State<DisplayMessageImagesPage> {
  bool _contentVisibility = true;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,MessageState?>(
      onInit: (store) => store.dispatch(LoadMessageAction(messageId: widget.messageId)),
      converter: (store) => store.state.messageEntityState.entities[widget.messageId],
      builder: (context,message){
        if(message == null) return const LoadingView();
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              StoreConnector<AppState,Iterable<MessageImageState>>(
                converter: (store) => store.state.messageImageEntityState.selectMessageImages(widget.messageId),
                builder: (context,images) => CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    viewportFraction: 1,
                    height: MediaQuery.sizeOf(context).height,
                    enableInfiniteScroll: false
                  ),
                  items: images.map(
                    (image) => Center(
                      child: DisplayImageWidget(
                        image: image.image,
                        status: image.status,
                        onTap: () => setState(() { _contentVisibility = !_contentVisibility;}),
                      )
                    ),
                  ).toList(),
                ),
              ),
              const Positioned(
                top: 15,
                child: AppBackButtonWidget(
                  color: Colors.white,
                  size: 30,
                )
              ),
              if(message.content != null && _contentVisibility)
                Positioned(
                  bottom: 0,
                  child: MessageContent(content: message.content!)
                ),
            ],
          ),
        );
      }
    );
  }
}