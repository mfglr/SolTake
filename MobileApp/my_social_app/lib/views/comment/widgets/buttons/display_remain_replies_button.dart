import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/action_dispathcers.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';

class DisplayRemainRepliesButton extends StatelessWidget {
  final CommentState comment;
  final bool isVisible;
  const DisplayRemainRepliesButton({
    super.key,
    required this.comment,
    required this.isVisible
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,int>(
      converter: (store) => selectNumberOfNotDisplayedReplies(store, isVisible, comment),
      builder:(context, numberOfNotDisplayedReplies) => 
      TextButton(
        onPressed: (){
          final store = StoreProvider.of<AppState>(context,listen: false);
          getNextPageIfReady(
            store,
            selectChildren(store, comment.id),
            NextCommentChildrenAction(parentId: comment.id)
          );
        },
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: const Icon(Icons.reply,size: 18)
            ),
            Text(
              "$numberOfNotDisplayedReplies",
              style: const TextStyle(fontSize: 11),
            )
          ],
        ),
      )
    );
  }
}