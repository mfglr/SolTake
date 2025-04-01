import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/entity_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';

class DisplayRepliesButton extends StatelessWidget {
  final CommentState comment;
  const DisplayRepliesButton({super.key,required this.comment});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final store = StoreProvider.of<AppState>(context,listen: false);
        getNextPageIfNoPage(store,comment.children,NextCommentChildrenAction(commentId: comment.id));
        store.dispatch(ChangeRepliesVisibilityAction(commentId: comment.id, visibility: true));
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 3),
            child: const Icon(Icons.reply,size: 18)
          ),
          Text(
            comment.numberOfNotDisplayedReplies.toString(),
            style: const TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }
}