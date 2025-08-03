import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/services/get_language.dart';
import 'package:my_social_app/state/app_state/comments_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/dialog_creator/dialog_creator.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'comment_popup_menu_texts.dart';

enum CommentsAction{
  delete
}

class CommentPopupMenu extends StatelessWidget {
  final CommentState comment;
  const CommentPopupMenu({
    super.key,
    required this.comment
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CommentsAction>(
      iconSize: 15,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onSelected: (value) async {
        switch(value){
          case CommentsAction.delete:
            bool response = await DialogCreator.showAppDialog(
              context,
              title[getLanguage(context)]!,
              description[getLanguage(context)]!,
              delete[getLanguage(context)]!
            );
            if(response && context.mounted){
              final store = StoreProvider.of<AppState>(context,listen: false);
              // store.dispatch(DeleteCommentAction(comment: comment));
            }
            return;
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem<CommentsAction>(
            value: CommentsAction.delete,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LanguageWidget(
                  child: (language) => Text(
                    delete[language]!,
                    style: const TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
                const Icon(
                  Icons.delete,
                  color: Colors.red,
                )
              ],
            )
          )
        ];
      }
    );
  }
}