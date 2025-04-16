import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/user/pages/user_page/widgets/user_block_alert_dialog/user_block_alert_dialog_texts.dart';

class UserBlockAlertDialog extends StatelessWidget {
  const UserBlockAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: LanguageWidget(
        child: (langauge) => Text(
          title[langauge]!
        )
      ),
      content: LanguageWidget(
        child: (langauge) => Text(
          content[langauge]!
        )
      ),
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
              LanguageWidget(
                child: (language) => Text(
                  block[language]!,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            ],
          )
        )
      ],
    );
  }
}