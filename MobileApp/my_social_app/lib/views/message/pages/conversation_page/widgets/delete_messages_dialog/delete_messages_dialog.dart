import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/message_entity_state/message_state.dart';
import 'package:my_social_app/views/message/pages/conversation_page/enums/message_deletion_type.dart';
import 'package:my_social_app/views/message/pages/conversation_page/widgets/delete_messages_dialog/delete_messages_dialog_texts.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class DeleteMessagesDialog extends StatelessWidget {
  final Iterable<MessageState> messages;
  const DeleteMessagesDialog({
    super.key,
    required this.messages
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: LanguageWidget(
        child: (language) => Text(titles[language]!)
      ),
      content: LanguageWidget(
        child: (language) => Text(contents[language]!)
      ),
      actions: [

        TextButton(
          onPressed: () => Navigator.of(context).pop(MessageDeletionType.cancel),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 4),
                child: const Icon(Icons.cancel),
              ),
              LanguageWidget(
                child: (language) => Text(cancel[language]!),
              )
            ],
          )
        ),

        TextButton(
          onPressed: () => Navigator.of(context).pop(MessageDeletionType.deleteFromMe), 
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
                  deleteFromMe[langauge]!,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            ],
          )
        ),
        
        if(!messages.any((e) => !e.isOwner))
          TextButton(
            onPressed: () => Navigator.of(context).pop(MessageDeletionType.deleteFromEveryone), 
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
                    deleteFromEveryone[langauge]!,
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
