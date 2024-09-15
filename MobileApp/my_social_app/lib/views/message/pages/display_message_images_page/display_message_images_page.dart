import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/message_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/app_state/message_image_entity_state/message_image_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/views/message/pages/display_message_images_page/widgets/message_content.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/circle_pagination_widget/circle_pagination_widget.dart';
import 'package:my_social_app/views/shared/display_image_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/user_image_with_names_widget.dart';

class DisplayMessageImagesPage extends StatefulWidget {

  static const int maxContentCharacters = 120;
  final int messageId;
  final int activeIndex;
  
  const DisplayMessageImagesPage({
    super.key,
    required this.messageId,
    this.activeIndex = 0,
  });

  @override
  State<DisplayMessageImagesPage> createState() => _DisplayMessageImagesPageState();
}

class _DisplayMessageImagesPageState extends State<DisplayMessageImagesPage> {
  bool _contentVisibility = true;
  int _activeIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _controller.jumpToPage(widget.activeIndex);
      setState(() { _activeIndex = widget.activeIndex; });
    });
    super.initState();
  }

  void _changeActiveIndex(int index){
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear
    );
    setState(() { _activeIndex = index; });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,MessageState?>(
      onInit: (store) => store.dispatch(LoadMessageAction(messageId: widget.messageId)),
      converter: (store) => store.state.messageEntityState.entities[widget.messageId],
      builder: (context,message){
        if(message == null) return const LoadingView();
        return GestureDetector(
          onTap: () => setState(() { _contentVisibility = !_contentVisibility; }),
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                StoreConnector<AppState,Iterable<MessageImageState>>(
                  converter: (store) => store.state.messageImageEntityState.selectMessageImages(widget.messageId),
                  builder: (context,images) => CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      autoPlay: false,
                      onPageChanged: (index, reason) => setState(() {
                        _activeIndex = index;
                      }),
                      viewportFraction: 1,
                      height: MediaQuery.sizeOf(context).height,
                      enableInfiniteScroll: false
                    ),
                    items: images.map(
                      (image) => Center(
                        child: DisplayImageWidget(
                          image: image.image,
                          status: image.status
                        )
                      ),
                    ).toList(),
                  ),
                ),
                if(_contentVisibility)
                  Positioned(
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 32,
                          bottom: 5
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: AppBackButtonWidget(
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              StoreConnector<AppState,UserState?>(
                                converter: (store) => store.state.userEntityState.entities[message.senderId],
                                onInit: (store) => store.dispatch(LoadUserAction(userId: message.senderId)),
                                builder: (store,user){
                                  if(user == null) return const SpaceSavingWidget();
                                  return UserImageWithNamesWidget(
                                    user: user,
                                    diameter: 40,
                                    userNameColor: Colors.white,
                                    nameColor: Colors.white,
                                  );
                                }
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                if(message.numberOfImages > 1)
                  Positioned(
                    bottom: 50,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CirclePaginationWidget(
                            numberOfCircles: message.numberOfImages,
                            activeIndex: _activeIndex,
                            changeActiveIndex: _changeActiveIndex
                          ),
                        ],
                      ),
                    )
                  ),
                if(message.content != null && _contentVisibility)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      color: Colors.black.withOpacity(0.5),
                      child: MessageContent(content: message.content!)
                    )
                  ),
              ],
            ),
          ),
        );
      }
    );
  }
}