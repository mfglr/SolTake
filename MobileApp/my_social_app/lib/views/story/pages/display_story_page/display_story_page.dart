import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/state/story_state/actions.dart';
import 'package:my_social_app/state/story_state/selectors.dart';
import 'package:my_social_app/state/story_state/story_state.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/story_items.dart';

class DisplayStoryPage extends StatefulWidget {
  final Iterable<Iterable<StoryState>> userStories;
  final int userId;
  const DisplayStoryPage({
    super.key,
    required this.userStories,
    required this.userId
  });

  @override
  State<DisplayStoryPage> createState() => _DisplayStoryPageState();
}

class _DisplayStoryPageState extends State<DisplayStoryPage> {
  final PageController _controller = PageController();

  void _viewFirstStoryOfPage(int page){
    final story = widget.userStories.elementAt(page).firstWhereOrNull((story) => !story.isViewed);
    if(story == null) return;
    
    final store = StoreProvider.of<AppState>(context,listen: false);
    if(isViewed(store, story.id)) return;
    store.dispatch(ViewStoryAction(storyId: story.id));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final index =  widget.userStories
        .mapIndexed((index,e) => (index: index, userId: e.first.userId))
        .where((e) => e.userId == widget.userId)
        .firstOrNull
        ?.index;
      if(index == null) return;
      
      _viewFirstStoryOfPage(index);
      _controller.jumpToPage(index);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
      controller: _controller,
      children: 
        widget.userStories
          .map((stories) => StoryItems(
            stories: stories,
            mainPageController: _controller,
            viewFirstStoryOfPage: _viewFirstStoryOfPage,
          ))
          .toList(),
      ),
    );
  }
}