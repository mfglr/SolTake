import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/comment_user_likes_state/actions.dart';
import 'package:my_social_app/state/comment_user_likes_state/comment_user_like_state.dart';
import 'package:my_social_app/state/comment_user_likes_state/selectors.dart';
import 'package:my_social_app/state/state.dart';
import 'package:my_social_app/custom_packages/entity_state/action_dispathcers.dart';
import 'package:my_social_app/custom_packages/entity_state/pagination.dart';
import 'package:my_social_app/views/comment/pages/display_comment_likes_page/widgets/no_comment_user_likes_widget.dart';
import 'package:my_social_app/views/comment/pages/display_comment_likes_page/widgets/comment_user_likes_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/shared/loading_circle_widget.dart';
import 'display_comment_likes_page_texts.dart';

class DisplayCommentLikesPage extends StatefulWidget {
  final int commentId;

  const DisplayCommentLikesPage({
    super.key,
    required this.commentId
  });

  @override
  State<DisplayCommentLikesPage> createState() => _DisplayCommentLikesPageState();
}

class _DisplayCommentLikesPageState extends State<DisplayCommentLikesPage> {
  final ScrollController _scrollController = ScrollController();

  void _onScrollBottom() => onScrollBottom(
    _scrollController,
    (){
      final store = StoreProvider.of<AppState>(context,listen: false);
      getNextPageIfReady(
        store,
        selectCommentUserLikes(store, widget.commentId),
        NextCommentUserLikesAction(commentId: widget.commentId)
      );  
    }
  );

  @override
  void initState() {
    _scrollController.addListener(_onScrollBottom);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollBottom);
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> onRefresh(){
    final store = StoreProvider.of<AppState>(context,listen: false);
    refreshEntities(
      store,
      selectCommentUserLikes(store, widget.commentId),
      NextCommentUserLikesAction(commentId: widget.commentId)
    );
    return onCommentUserLikesLoaded(store, widget.commentId);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButtonWidget(),
          title: LanguageWidget(
            child: (language) => AppTitle(
              title: title[language]!
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: StoreConnector<AppState, Pagination<int, CommentUserLikeState>>(
            onInit: (store) =>
              getNextPageIfNoPage(
                store,
                selectCommentUserLikes(store, widget.commentId),
                NextCommentUserLikesAction(commentId: widget.commentId)
              ),
            converter: (store) => selectCommentUserLikes(store, widget.commentId),
            builder: (context, pagination) =>  Column(
              children: [
                if(pagination.isEmpty)
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                    child: const NoCommentUserLikesWidget()
                  )
                else
                  CommentUserLikesWidget(
                    commentUserLikes: pagination.values
                  ),
                if(pagination.loadingNext)
                  const LoadingCircleWidget()
              ],
            ),
          ),
        )
      ),
    );
  }
}