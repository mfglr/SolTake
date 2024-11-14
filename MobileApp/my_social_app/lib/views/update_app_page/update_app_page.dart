import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

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
              child: Text(
                AppLocalizations.of(context)!.update_page_app_content,
                style: const TextStyle(
                  fontSize: 20
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}