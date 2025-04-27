import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/story_state/actions.dart';
import 'package:my_social_app/state/app_state/story_state/selectors.dart';
import 'package:my_social_app/state/app_state/story_state/story_state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/story/pages/display_story_user_views_page/widgets/story_user_view_items.dart';

import 'display_story_user_views_page_texts.dart' show title;

class DisplayStoryUserViewsPage extends StatefulWidget {
  final int storyId;
  const DisplayStoryUserViewsPage({
    super.key,
    required this.storyId
  });

  @override
  State<DisplayStoryUserViewsPage> createState() => _DisplayStoryUserViewsPageState();
}

class _DisplayStoryUserViewsPageState extends State<DisplayStoryUserViewsPage> {
  final ScrollController _controller = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _controller,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextEntitiesIfReady(store, selectStoryUserViewPagination(store, widget.storyId), NextStoryUserViewsAction(storyId: widget.storyId));
    }
  );

  @override
  void initState() {
    _controller.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollBottom);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        store.dispatch(FirstStoryUserViewsAction(storyId: widget.storyId));
        return store.onChange.map((state) => state.stories.getValue(widget.storyId)!.viewers).firstWhere((e) => !e.loadingNext);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: LanguageWidget(
            child: (language) => AppTitle(
              title: title[language]!
            ) 
          ),
        ),
        body: StoreConnector<AppState,StoryState>(
          onInit: (store) => getNextEntitiesIfNoPage(store, selectStoryUserViewPagination(store, widget.storyId), NextStoryUserViewsAction(storyId: widget.storyId)),
          converter: (store) => selectStory(store,widget.storyId),
          builder: (context,story) => SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height
              ),
              child: StoryUserViewItems(
                storyUserViews: story.viewers.values
              ),
            ),
          ),
        ),
      ),
    );
  }
}