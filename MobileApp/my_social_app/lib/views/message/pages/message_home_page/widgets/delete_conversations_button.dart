import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';

class DeleteConversationsButton extends StatelessWidget {
  final void Function() deleteConversations;
  const DeleteConversationsButton({
    super.key,
    required this.deleteConversations
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: deleteConversations,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.delete_conversations_button,
            style: const TextStyle(
              color: Colors.red
            ),
          )
        ],
      )
    );
  }
}