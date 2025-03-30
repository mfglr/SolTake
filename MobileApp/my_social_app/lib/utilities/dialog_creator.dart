import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogCreator{

  static Future<bool> showAppDialog(BuildContext context, String title, String content,String contentOfApproveButton){
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
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
              onPressed: () async {
                Navigator.of(context).pop(true);
              }, 
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ),
                  Text(
                    contentOfApproveButton,
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              )
            )
          ],
        );
      }
    ).then((value) => value ?? false);
  }

}