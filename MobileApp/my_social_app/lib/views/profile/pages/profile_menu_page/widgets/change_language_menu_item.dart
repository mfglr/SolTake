import 'package:flutter/material.dart';
import 'package:my_social_app/views/profile/pages/change_language_page/change_language_page.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLanguageMenuItem extends StatelessWidget {
  const ChangeLanguageMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileMenuItem(
      name: AppLocalizations.of(context)!.change_language_menu_item_name,
      icon: Icons.language,
      onPressed: () => 
        Navigator
          .of(context)
          .push(MaterialPageRoute(builder: (context) => const ChangeLanguagePage()))
    );
  }
}