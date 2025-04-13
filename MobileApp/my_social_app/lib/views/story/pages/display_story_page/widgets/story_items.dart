import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/constants/assets.dart';
import 'package:my_social_app/services/app_client.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/selectors.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_item.dart';

class StoryItems extends StatefulWidget {
  final Iterable<StoryState> stories;
  final PageController mainPageController;
  final void Function(int page) viewFirstStoryOfPage;

  const StoryItems({
    super.key,
    required this.stories,
    required this.mainPageController,
    required this.viewFirstStoryOfPage
  });

  @override
  State<StoryItems> createState() => _StoryItemsState();
}

class _StoryItemsState extends State<StoryItems> {
  final PageController _pageController = PageController();
  late int _activeIndex;

  void _viewStory(){
    final story = widget.stories.elementAt(_activeIndex);
    final store = StoreProvider.of<AppState>(context,listen: false);
    if(!isViewed(store, story.id)){
      final store = StoreProvider.of<AppState>(context,listen: false);
      store.dispatch(ViewStoryAction(storyId: story.id));
    }
  }

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
          else{
            var page = widget.mainPageController.page?.round();
            if(page == null) return;
            widget.viewFirstStoryOfPage(page);
          }
        });
    }
    else{
      _viewStory();
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
          else{
            var page = widget.mainPageController.page?.round();
            if(page == null) return;
            widget.viewFirstStoryOfPage(page);
          }
        });
    }
    else{
      _viewStory();
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
              baseUrl: AppClient.blobService,
              notFoundImagePath: noMediaAssetPath,
              next: _next,
              prev: _prev,
            ))
            .toList(),
        ),
      ],
    );
  }
}