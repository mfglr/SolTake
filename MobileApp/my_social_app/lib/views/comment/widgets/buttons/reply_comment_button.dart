import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      child: Text(
        AppLocalizations.of(context)!.reply_comment_button,
        style: const TextStyle(fontSize: 11)
      )
    );
  }
}