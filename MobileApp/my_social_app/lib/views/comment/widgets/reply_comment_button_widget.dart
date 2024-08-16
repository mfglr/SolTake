import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/store.dart';

class ReplyCommentButtonWidget extends StatelessWidget {
  
  final TextEditingController contentController;
  final FocusNode focusNode;
  final CommentState comment;
  final bool isRoot;

  const ReplyCommentButtonWidget({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.comment,
    required this.isRoot
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        final content =  "@${comment.userName} ";
        store.dispatch(ChangeCommentAction(comment: comment,isRoot: isRoot));
        store.dispatch(ChangeContentAction(content: content));
        contentController.text = content;
        focusNode.requestFocus();
      },
      child: const Text("Reply", style: TextStyle(fontSize: 12))
    );
  }
}