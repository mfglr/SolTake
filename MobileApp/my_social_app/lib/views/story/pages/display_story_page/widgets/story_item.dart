import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:multimedia_slider/widgets/multimedia_player.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/helpers/stoppable_timer.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_loading_line.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class StoryItem extends StatefulWidget {

  final StoryState story;
  final int index;
  final int numberOfItems;
  final void Function() next;
  final void Function() prev;

  const StoryItem({
    super.key,
    required this.story,
    required this.index,
    required this.numberOfItems,
    required this.next,
    required this.prev
  });

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  late final StoppableTimer _timer;
  final int _interval = 10;
  double _rate = 0;

  @override
  void initState() {
    var duration = widget.story.media.multimediaType == MultimediaType.video ? widget.story.media.duration : 10.0;
    final lastTick = duration * _interval;

    _timer = StoppableTimer(
      Duration(milliseconds: (1000 / _interval).round()),
      (tick){
        if(tick > lastTick){
          widget.next();
          _timer.cancel();
        }
        setState(() => _rate = tick / lastTick);
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: _timer.stop,
      onLongPressUp: _timer.start,
      child: Stack(
        fit: StackFit.expand,
        children: [
          MultimediaPlayer(
            media: widget.story.media,
            blobServiceUrl: AppClient.blobService,
            notFoundImagePath: noMediaAssetPath,
            noImagePath: noMediaAssetPath,
            play: true,
            displayPlayButton: false,
            displayRemaningDuration: false,
            displayVolume: false,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: widget.prev,
                  child: Container(
                    color: Colors.transparent,
                  ),
                )
              ),
              Expanded(
                child: GestureDetector(
                  onTap: widget.next,
                  child: Container(
                    color: Colors.transparent,
                  ),
                )
              )
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.width / 64,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StoryLoadingLine(
                  numberOfItems: widget.numberOfItems,
                  activeIndex: widget.index,
                  rate: _rate,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  child: TextButton(
                    onPressed: (){
                      _timer.stop();
                      Navigator
                        .of(context)
                        .push(MaterialPageRoute(builder: (context) => UserPage(userId: widget.story.userId,)))
                        .then((_) => _timer.start());
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: UserImageWidget(
                            image: widget.story.image,
                            diameter: 50
                          ),
                        ),
                        Text(
                          widget.story.userName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}