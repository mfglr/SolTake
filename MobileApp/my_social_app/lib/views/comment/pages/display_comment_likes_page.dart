import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/user_entity_state/user_state.dart';
import 'package:my_social_app/state/entity_state/entity_container.dart';
import 'package:my_social_app/state/entity_state/loading_state.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title_widget.dart';
import 'package:my_social_app/views/shared/loading_view.dart';
import 'package:my_social_app/views/shared/pages/not_found_page.dart';
import 'package:my_social_app/views/shared/space_saving_widget.dart';
import 'package:my_social_app/views/user/widgets/follow_icon_button_widget.dart';
import 'package:my_social_app/views/user/widgets/user_items_widget.dart';

class DisplayCommentLikesPage extends StatelessWidget {
  final int commentId;

  const DisplayCommentLikesPage({
    super.key,
    required this.commentId
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,EntityContainer<CommentState>?>(
      onInit: (store) => store.dispatch(LoadCommentAction(commentId: commentId)),
      converter: (store) => store.state.commentEntityState.containers[commentId],
      builder:(context,commentContainer){
        if(commentContainer == null || commentContainer.state == LoadingState.started){
          return const LoadingView();
        }
        if(commentContainer.state == LoadingState.notFound){
          return const NotFoundPage(message: "The comment was deleted");
        }
        return Scaffold(
          appBar: AppBar(
            leading: const AppBackButtonWidget(),
            title: const AppTitleWidget(title: "Likes"),
          ),
          body: StoreConnector<AppState,Iterable<UserState>>(
            onInit: (store) => store.dispatch(GetNextPageCommentLikesIfNoPageAction(commentId: commentId)),
            converter: (store) => store.state.selectCommentLikes(commentId),
            builder: (context,users) => UserItemsWidget(
              users: users,
              pagination: commentContainer.entity.likes,
              rigthButtonBuilder: (user) => StoreConnector<AppState,int>(
                converter: (store) => store.state.accountState!.id,
                builder:(context,accountId){
                  if(accountId == user.id) return const SpaceSavingWidget();
                  return FollowIconButtonWidget(user: user);
                }
              ),
              onScrollBottom: (){
                final store = StoreProvider.of<AppState>(context,listen: false);
                store.dispatch(GetNextPageCommentLikesIfReadyAction(commentId: commentId));
              }
            ),
          ),
        );
      }
    );
  }
}