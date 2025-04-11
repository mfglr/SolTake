import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:multimedia/models/multimedia_status.dart';
import 'package:my_social_app/helpers/stoppable_timer.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_loading_line.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_user_header.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class StoryImageItem extends StatefulWidget {
  final StoryState story;
  final String baseUrl;
  final String notFoundImagePath;
  final int numberOfItems;
  final int index;
  final void Function() next;
  final void Function() prev;
  final Map<String,String>? headers;
  
  const StoryImageItem({
    super.key,
    required this.story,
    required this.baseUrl,
    required this.notFoundImagePath,
    required this.numberOfItems,
    required this.index,
    required this.next,
    required this.prev,
    this.headers,
  });

  @override
  State<StoryImageItem> createState() => _StoryImageItemState();
}

class _StoryImageItemState extends State<StoryImageItem> {
  late MultimediaStatus _status;
  late final Uint8List _image;
  late final String url;
  late final StoppableTimer _timer;
  final int _interval = 1;
  double _rate = 0;
  
  @override
  void initState() {
    var duration = 5.0;
    final lastTick = duration * _interval;

    _timer = StoppableTimer(
      Duration(milliseconds: (1000 / _interval).round()),
      (tick){
        if(tick >= lastTick){
          widget.next();
        }
        setState(() => _rate = tick / lastTick);
      }
    );

    _status = MultimediaStatus.started;
    url = "${widget.baseUrl}/${widget.story.media.containerName}/${widget.story.media.blobName}";
    
    DefaultCacheManager()
      .getSingleFile(url,headers: widget.headers)
      .then((file) => file.readAsBytes())
      .then((list) => setState(() {
        _image = list;
        _status = MultimediaStatus.done;
      }))
      .catchError((_) => setState(() { _status = MultimediaStatus.notFound; }));
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
          Builder(
            builder: (context){
              if(_status == MultimediaStatus.done){
                return Image.memory(
                  _image,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                );
              }
              if (_status == MultimediaStatus.started) return const Center(child: CircularProgressIndicator());
              return Image.asset(
                widget.notFoundImagePath,
                fit: BoxFit.contain
              );
            }
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
                    child: StoryUserHeader(story: widget.story,)
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