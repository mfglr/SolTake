import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.notifications_off,
            size: 50,
          ),
          Text(
            AppLocalizations.of(context)!.no_notifications_content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40
            ),
          )
        ],
      ),
    );
  }
}