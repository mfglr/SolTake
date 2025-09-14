import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:multimedia_slider/multimedia_slider.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/message_entity_state/message_state.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/users_state/selectors.dart';
import 'package:my_social_app/state/users_state/user_state.dart';
import 'package:my_social_app/state/users_state/action.dart';
import 'package:my_social_app/views/message/pages/display_message_images_page/widgets/message_content.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/user_image_with_names_widget.dart';

class DisplayMessageImagesPage extends StatefulWidget {

  static const int maxContentCharacters = 120;
  final MessageState message;
  final int activeIndex;
  
  const DisplayMessageImagesPage({
    super.key,
    required this.message,
    this.activeIndex = 0,
  });

  @override
  State<DisplayMessageImagesPage> createState() => _DisplayMessageImagesPageState();
}

class _DisplayMessageImagesPageState extends State<DisplayMessageImagesPage> {
  bool _contentVisibility = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() { _contentVisibility = !_contentVisibility; }),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MultimediaSlider(
                //   medias: widget.message.medias,
                //   blobServiceUrl: AppClient.blobService,
                //   notFoundMediaPath: noMediaAssetPath,
                //   noMediaPath: noMediaAssetPath,
                //   activeIndex: widget.activeIndex,
                // ),
              ],
            ),
            if(_contentVisibility)
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withAlpha(153),
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
                            converter: (store) => selectUserById(store, widget.message.senderId).entity,
                            onInit: (store) => store.dispatch(LoadUserByIdAction(id: widget.message.senderId)),
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
            if(widget.message.content != null && _contentVisibility)
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  color: Colors.black.withAlpha(153),
                  child: MessageContent(content: widget.message.content!)
                )
              ),
          ],
        ),
      ),
    );
  }
}