import 'package:flutter/material.dart';
import 'package:my_social_app/l10n/app_localizations.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'update_app_page_texts.dart';

final urlMarket = Uri.parse('market://details?id=com.soltake');
final urlBrowser = Uri.parse('https://play.google.com/store/apps/details?id=com.soltake');

class UpdateAppPage extends StatelessWidget {
  const UpdateAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo-bgremoved.png",
            ),
            FilledButton(
              onPressed: () async {
                if (await canLaunchUrl(urlMarket)) {
                  await launchUrl(urlMarket);
                } else {
                  await launchUrl(urlBrowser);
                }
              },
              child: Text(AppLocalizations.of(context)!.update_page_app_button_content)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LanguageWidget(
                child: (language) => Text(
                  content[language]!,
                  style: const TextStyle(
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}