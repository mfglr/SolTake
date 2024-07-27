import 'package:flutter/material.dart';
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/create_comment_state/actions.dart';
import 'package:my_social_app/state/store.dart';

class ReplyCommentButtonWidget extends StatelessWidget {
  final CommentState comment;
  final bool isRoot;
  const ReplyCommentButtonWidget({super.key,required this.comment,required this.isRoot});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        store.dispatch(
          ChangeCommentAction(
            comment: comment,
            isRoot: isRoot
          )
        );
        store.dispatch(
          ChangeContentAction(content: "@${comment.formatUserName(10)} ")
        );
      },
      child: const Text("Reply")
    );
  }
}