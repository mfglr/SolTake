import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/store.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'hide_replies_button_texts.dart';

class HideRepliesButton extends StatelessWidget {
  final CommentState comment;
  const HideRepliesButton({super.key,required this.comment});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:() => store.dispatch(ChangeRepliesVisibilityAction(commentId: comment.id, visibility: false)),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon( Icons.visibility_off_outlined,size: 18),
          ),
          LanguageWidget(
            child: (langauge) => Text(
              content[langauge]!, 
              style: const TextStyle(fontSize: 11)
            ),
          ),
        ],
      )
    );
  }
}