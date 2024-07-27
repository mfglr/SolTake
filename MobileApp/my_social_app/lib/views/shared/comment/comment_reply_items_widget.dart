import 'package:flutter/material.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/views/shared/comment/comment_reply_item_widget.dart';

class CommentReplyItemsWidget extends StatelessWidget {
  final Iterable<CommentState> replies;
  const CommentReplyItemsWidget({super.key,required this.replies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        replies.length,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: CommentReplyItemWidget(
            reply: replies.elementAt(index)
          )
        )
      ),
    );
  }
}