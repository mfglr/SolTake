import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_loading_line.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_user_header.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';
import 'package:video_player/video_player.dart';

class StoryVideoItem extends StatefulWidget {
  final StoryState story;
  final int index;
  final int numberOfItems;
  final String baseUrl;
  final void Function() next;
  final void Function() prev;

  const StoryVideoItem({
    super.key,
    required this.story,
    required this.index,
    required this.numberOfItems,
    required this.next,
    required this.prev,
    required this.baseUrl,
  });

  @override
  State<StoryVideoItem> createState() => _StoryVideoItemState();
}

class _StoryVideoItemState extends State<StoryVideoItem> {
  double _rate = 0;
  late final VideoPlayerController _controller;
  bool _nextFlag = true;

  void _setRate() =>
    setState(() => _rate =_controller.value.position.inMilliseconds / _controller.value.duration.inMilliseconds);

  void _onDone(){
    if(_nextFlag && _controller.value.isCompleted){
      widget.next();
      _nextFlag = false;
    }
  }

  @override
  void initState() {
    _controller = 
      VideoPlayerController
        .networkUrl(
          Uri.parse(
            "${widget.baseUrl}/${widget.story.media.containerName}/${widget.story.media.blobName}"
          )
        );

    _controller
      .initialize()
      .then((_) => _controller.play())
      .then((_) => setState(() {}));

    _controller.addListener(_setRate);
    _controller.addListener(_onDone);

    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_setRate);
    _controller.removeListener(_onDone);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _controller.pause(),
      onLongPressUp: () => _controller.play(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AspectRatio(
            aspectRatio: widget.story.media.aspectRatio,
            child: VideoPlayer(
              _controller
            )
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
                      _controller.pause();
                      Navigator
                        .of(context)
                        .push(MaterialPageRoute(builder: (context) => UserPage(userId: widget.story.userId,)))
                        .then((_) => _controller.play());
                    },
                    child: StoryUserHeader(story: widget.story),
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