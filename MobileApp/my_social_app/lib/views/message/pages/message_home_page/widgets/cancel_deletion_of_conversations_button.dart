import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';

class CancelDeletionOfConversationsButton extends StatelessWidget {
  final void Function() clearConverations;
  const CancelDeletionOfConversationsButton({
    super.key,
    required this.clearConverations
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: clearConverations,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const Icon(Icons.cancel),
          ),
          Text(
            AppLocalizations.of(context)!.cancel_deletion_of_conversations_button
          )
        ],
      )
    );
  }
}