import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/create_comment_state/actions.dart';
import 'package:my_social_app/state/app_state/store.dart';

class ReplyCommentButtonWidget extends StatelessWidget {
  
  final TextEditingController contentController;
  final FocusNode focusNode;
  final CommentState comment;

  const ReplyCommentButtonWidget({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        store.dispatch(ChangeCommentAction(comment: comment));
        contentController.text = "@${comment.userName} ";
        focusNode.requestFocus();
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: const Text("Reply", style: TextStyle(fontSize: 11))
    );
  }
}