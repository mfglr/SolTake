import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/helpers/on_scroll_bottom.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/views/comment/widgets/comment_user_likes_widget.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'display_comment_likes_page_texts.dart' show title;

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
      final pagination = store.state.commentEntityState.getValue(widget.commentId)!.likes;
      getNextPageIfReady(store, pagination, NextCommentLikesAction(commentId: widget.commentId));  
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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,CommentState>(
      onInit: (store){
        final store = StoreProvider.of<AppState>(context,listen: false);
        final pagination = store.state.commentEntityState.getValue(widget.commentId)!.likes;
        getNextPageIfNoPage(store, pagination, NextCommentLikesAction(commentId: widget.commentId));  
      },
      converter: (store) => store.state.commentEntityState.getValue(widget.commentId)!,
      builder:(context,comment) => Scaffold(
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
          child: CommentUserLikesWidget(commentUserLikes: comment.likes.values),
        )
      )
    );
  }
}