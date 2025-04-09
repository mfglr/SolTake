import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/helpers/stoppable_timer.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/shared/app_avatar/widgets/user_image_widget.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_item.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_loading_line.dart';
import 'package:my_social_app/views/user/pages/user_page.dart';

class StoryItems extends StatefulWidget {
  final Iterable<StoryState> stories;
  final PageController mainPageController;

  const StoryItems({
    super.key,
    required this.stories,
    required this.mainPageController
  });

  @override
  State<StoryItems> createState() => _StoryItemsState();
}

class _StoryItemsState extends State<StoryItems> {
  final PageController _pageController = PageController();
  late int _activeIndex;
  final int _interval = 5;
  final int _duration = 10;
  late final int _lastTick;
  double rate = 0;
  late StoppableTimer _timer;

  void _next(){
    setState((){
      rate = 0;
      _activeIndex = _activeIndex + 1;
    });
    if(_activeIndex == widget.stories.length){
      final page = widget.mainPageController.page;
      widget.mainPageController
        .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear)
        .then((_){
          if(widget.mainPageController.page == page && mounted){
            Navigator.of(context).pop();
          }
        });
    }
    else{
      _pageController.jumpToPage(_activeIndex);
    }
    _timer.reset();
  }

  void _prev(){
    setState(() => _activeIndex = _activeIndex - 1);
    if(_activeIndex == -1){
      final page = widget.mainPageController.page;
      widget.mainPageController
        .previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear)
        .then((_){
          if(page == widget.mainPageController.page && mounted){
            Navigator.of(context).pop();
          }
        });
    }
    else{
      _pageController.jumpToPage(_activeIndex);
    }
    _timer.reset();
  }

  @override
  void initState() {
    _lastTick = _duration * _interval;

    _activeIndex = widget.stories
      .mapIndexed((index,story) => (story: story,index: index))
      .where((e) => !e.story.isViewed)
      .firstOrNull?.index ?? 0;
    
    _timer = StoppableTimer(
      Duration(milliseconds: (1000 / _interval).toInt()),
      (tick){
        if(tick != 0 && tick % _lastTick == 0){ _next(); }
        setState(() => rate = ((tick % _lastTick) / _lastTick));
      }
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: widget.stories.map((story) => StoryItem(story: story)).toList(),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onLongPress: _timer.stop,
                    onLongPressUp: _timer.start,
                    onTap: _prev,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  )
                ),
                Expanded(
                  child: GestureDetector(
                    onLongPress: _timer.stop,
                    onLongPressUp: _timer.start,
                    onTap: _next,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  )
                )
              ],
            )
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 64,
          left: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: widget.stories
                  .map((e) => StoryLoadingLine(
                    numberOfItems: widget.stories.length,
                    activeIndex: _activeIndex,
                    rate: rate,
                  ))
                  .toList(),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5,top: 5),
                child: TextButton(
                  onPressed: (){
                    _timer.stop();
                    Navigator
                      .of(context)
                      .push(MaterialPageRoute(builder: (context) => UserPage(userId: widget.stories.first.userId,)))
                      .then((_) => _timer.start());
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: UserImageWidget(
                          image: widget.stories.first.image,
                          diameter: 50
                        ),
                      ),
                      Text(
                        widget.stories.first.userName,
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
          ),
        )
      ],
    );
  }
}