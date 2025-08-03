import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'reply_comment_button_texts.dart' show content;

class ReplyCommentButton extends StatelessWidget {
  
  final TextEditingController contentController;
  final FocusNode focusNode;
  final CommentState comment;
  final void Function(CommentState) replyComment;
  final void Function() cancelReplying;

  const ReplyCommentButton({
    super.key,
    required this.contentController,
    required this.focusNode,
    required this.comment,
    required this.replyComment,
    required this.cancelReplying,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        replyComment(comment);
        WidgetsBinding.instance.addPostFrameCallback((_){
          FocusScope.of(context).requestFocus(focusNode);
        });
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: LanguageWidget(
        child: (language) => Text(
          content[language]!,
          style: const TextStyle(fontSize: 11)
        ),
      )
    );
  }
}