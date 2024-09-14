import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              AppLocalizations.of(context)!.comment_popup_menu_title,
              AppLocalizations.of(context)!.comment_popup_menu_description,
            );
            if(response && context.mounted){
              final store = StoreProvider.of<AppState>(context,listen: false);
              store.dispatch(RemoveCommentAction(comment: comment));
            }
          default:
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
                Text(
                  AppLocalizations.of(context)!.comment_popup_menu_delete_action,
                  style: const TextStyle(
                    color: Colors.red
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