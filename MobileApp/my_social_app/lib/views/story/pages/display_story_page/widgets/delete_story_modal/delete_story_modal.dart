import 'package:flutter/material.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:my_social_app/views/story/pages/display_story_page/widgets/delete_story_modal/delete_story_modal_texts.dart';

class DeleteStoryModal extends StatelessWidget {
  const DeleteStoryModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: LanguageWidget(
        child: (language) => Text(title[language]!)
      ),
      content: LanguageWidget(
        child: (language) => Text(content[language]!)
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
                  cancel[language]!
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
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )
              ),
              LanguageWidget(
                child: (langauge) => Text(
                  approve[langauge]!,
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