import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_item.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_loading_line.dart';

class StoryItems extends StatefulWidget {
  final Iterable<StoryState> stories;
  const StoryItems({
    super.key,
    required this.stories
  });

  @override
  State<StoryItems> createState() => _StoryItemsState();
}

class _StoryItemsState extends State<StoryItems> {
  final PageController _pageController = PageController();
  late int _activeIndex;
  final int _interval = 4;
  double rate = 0;
  late final Timer _timer;

  void _next(){
    setState(() => _activeIndex = (_activeIndex + 1) % widget.stories.length);
    _pageController.jumpToPage(_activeIndex);
  }
    

  void _prev(){
    setState(() =>_activeIndex = (_activeIndex - 1) % widget.stories.length);
    _pageController.jumpToPage(_activeIndex);
  }


  @override
  void initState() {
    _activeIndex = widget.stories
      .mapIndexed((index,story) => (story: story,index: index))
      .where((e) => !e.story.isViewed)
      .firstOrNull?.index ?? 0;
    
    final lastTick = 10 * _interval;
    _timer = Timer.periodic(
      Duration(milliseconds: (1000 / _interval).toInt()),
      (timer){
        if(timer.tick != 0 && timer.tick % lastTick == 0){
          _next();
        }
        setState(() => rate = ((timer.tick % lastTick) / lastTick));
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
                    onTap: _next,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  )
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _prev,
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
          top: 0,
          child: Row(
            children: widget.stories
              .map((e) => StoryLoadingLine(
                numberOfItems: widget.stories.length,
                activeIndex: _activeIndex,
                next: _next,
                rate: rate,
              ))
              .toList(),
          ),
        )
      ],
    );
  }
}