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
  
  late int _activeIndex;

  @override
  void initState() {
    _activeIndex = widget.stories
      .mapIndexed((index,story) => (story: story,index: index))
      .where((e) => !e.story.isViewed)
      .firstOrNull?.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _activeIndex = (_activeIndex + 1) % widget.stories.length),
      child: Stack(
        fit: StackFit.expand,
        children: [
          StoryItem(story: widget.stories.elementAt(_activeIndex)),
          Positioned(
            bottom: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.stories
                .map((e) => StoryLoadingLine(
                  width: MediaQuery.of(context).size.width / widget.stories.length,
                  height: 5
                ))
                .toList(),
            )
          )
          
          
        ],
      ),
    );
  }
}