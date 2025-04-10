import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_items.dart';

class Stories extends StatefulWidget {
  final Iterable<Iterable<StoryState>> userStories;
  final int? userId;

  const Stories({
    super.key,
    required this.userStories,
    this.userId
  });

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  final PageController _controller = PageController();

  @override
  void initState() {
    if(widget.userId != null){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller
          .jumpToPage(
            widget.userStories
              .mapIndexed((index,e) => (index: index, userId: e.first.userId))
              .where((e) => e.userId == widget.userId)
              .first
              .index
          );
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: 
        widget.userStories
          .map((stories) => StoryItems(
            stories: stories,
            mainPageController: _controller
          ))
          .toList(),
    );
  }
}