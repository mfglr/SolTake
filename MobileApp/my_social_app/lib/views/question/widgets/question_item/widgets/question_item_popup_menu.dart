import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/utilities/dialog_creator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum QuestionActions{
  delete
}

class QuestionItemPopupMenu extends StatelessWidget {
  final QuestionState question;
  const QuestionItemPopupMenu({
    super.key,
    required this.question
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<QuestionActions>(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        minimumSize: WidgetStateProperty.all(const Size(0, 0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onSelected: (value) async {
        switch(value){
          case QuestionActions.delete:
            DialogCreator
              .showAppDialog(
                context,
                AppLocalizations.of(context)!.question_item_popup_menu_title,
                AppLocalizations.of(context)!.question_item_popup_menu_description,
                AppLocalizations.of(context)!.show_app_dialog_delete_button
              )
              .then((response){
                if(response){
                  final store = StoreProvider.of<AppState>(context,listen: false);
                  store.dispatch(DeleteQuestionAction(questionId: question.id));
                }
              });
          default:
            return;
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem<QuestionActions>(
            value: QuestionActions.delete,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.question_item_popup_menu_delete_action,
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