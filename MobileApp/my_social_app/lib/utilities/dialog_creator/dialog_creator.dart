import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'dialog_creator_texts.dart';

class DialogCreator{

  static Future<bool> showAppDialog(
    BuildContext context,
    String title,
    String content,
    String contentOfApproveButton,
    IconData icon,
    Color color,
  ){
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
                  LanguageWidget(
                    child: (language) => Text(
                      cancel[language]!,
                    ),
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
                    margin: const EdgeInsets.only(right: 4),
                    child: Icon(
                      icon,
                      color: color,
                    )
                  ),
                  Text(
                    contentOfApproveButton,
                    style: TextStyle(color: color),
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