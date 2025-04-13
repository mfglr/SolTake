import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:multimedia/models/multimedia_type.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_image_item.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_video_item.dart';

class StoryItem extends StatefulWidget {
  final StoryState story;
  final int index;
  final int numberOfItems;
  final String notFoundImagePath;
  final String baseUrl;
  final void Function() next;
  final void Function() prev;

  const StoryItem({
    super.key,
    required this.notFoundImagePath,
    required this.story,
    required this.index,
    required this.numberOfItems,
    required this.next,
    required this.prev,
    required this.baseUrl
  });

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  @override
  void initState() {
    if(!widget.story.isViewed){
      final store = StoreProvider.of<AppState>(context,listen: false);
      store.dispatch(ViewStoryAction(storyId: widget.story.id));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.story.media.multimediaType == MultimediaType.video
      ? StoryVideoItem(
          story: widget.story,
          index: widget.index,
          numberOfItems: widget.numberOfItems,
          next: widget.next,
          prev: widget.prev,
          baseUrl: widget.baseUrl
        )
      : StoryImageItem(
          story: widget.story,
          baseUrl: widget.baseUrl,
          notFoundImagePath: widget.notFoundImagePath,
          numberOfItems: widget.numberOfItems,
          index: widget.index,
          next: widget.next,
          prev: widget.prev
        );
  }
}