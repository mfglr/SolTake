import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_item.dart';

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

  void _next(){
    _activeIndex += 1;
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
  }

  void _prev(){
    _activeIndex -= 1;
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
  }

  @override
  void initState() {
    _activeIndex = widget.stories
      .mapIndexed((index,story) => (story: story,index: index))
      .where((e) => !e.story.isViewed)
      .firstOrNull?.index ?? 0;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(_activeIndex);
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.stories
            .mapIndexed((index,story) => StoryItem(
              story: story,
              index: index,
              numberOfItems: widget.stories.length,
              next: _next,
              prev: _prev,
            ))
            .toList(),
        ),
      ],
    );
  }
}