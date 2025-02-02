import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AiItem extends StatelessWidget {
  final String model;
  final int questionId;
  const AiItem({
    super.key,
    required this.model,
    required this.questionId
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
    return TextButton(
      onPressed: () => 
        createDialog(context)
        .then((value){
          if(value && context.mounted) Navigator.of(context).pop(model);
        }),
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  "assets/images/$model.webp",
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  fit: BoxFit.cover,
                ),
              ),
              Text(model)
            ],
          ),
        ),
      ),
    );
  }
}