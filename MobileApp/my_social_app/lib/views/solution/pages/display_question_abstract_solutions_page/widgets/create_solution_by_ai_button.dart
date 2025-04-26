import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/views/create_solution_by_ai/select_models_page/select_models_page.dart';

class CreateSolutionByAiButton extends StatelessWidget {
  final QuestionState question;
  const CreateSolutionByAiButton({
    super.key,
    required this.question
  });

  Future<bool> createDialog(BuildContext context) =>
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.ai_item_modal_title),
        content: Text(AppLocalizations.of(context)!.ai_item_modal_content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: const Icon(Icons.cancel),
                ),
                Text(
                  AppLocalizations.of(context)!.show_app_dialog_cancel_button,
                )
              ],
            )
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), 
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: const Icon(FontAwesomeIcons.robot)
                  ),
                ),
                Text(AppLocalizations.of(context)!.ai_item_modal_create_solution_button)
              ],
            )
          )
        ],
      )
    )
    .then((value) => value ?? false);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Text(AppLocalizations.of(context)!.create_solution_by_ai_button_label)
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.blue,
          ),
          child: const FaIcon(FontAwesomeIcons.robot),
          onPressed: () =>
            createDialog(context)
              .then((value){
                if(value && context.mounted){
                  Navigator
                    .of(context)
                    .push(MaterialPageRoute(builder: (context) => SelectModelsPage(question: question)))
                    .then((value){
                      if(value != null && context.mounted){
                        final store = StoreProvider.of<AppState>(context,listen: false);
                        store.dispatch(CreateSolutionByAIAction(
                          model: value.model,
                          questionId: question.id,
                          blobName: value.blobName,
                          position: value.position,
                          prompt: value.prompt,
                          isHighResulation: value.isHighResulation
                        ));
                      }
                    });
                }
              })
        ),
      ],
    );
  }
}