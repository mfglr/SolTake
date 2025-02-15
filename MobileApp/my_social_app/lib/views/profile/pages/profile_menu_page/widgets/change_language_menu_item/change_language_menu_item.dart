import 'package:flutter/material.dart';
import 'package:my_social_app/views/profile/pages/change_language_page/change_language_page.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/change_language_menu_item/change_language_menu_item_texts.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

class ChangeLanguageMenuItem extends StatelessWidget {
  const ChangeLanguageMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (language) => ProfileMenuItem(
        name: content[language]!,
        icon: Icons.language,
        onPressed: () => 
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => const ChangeLanguagePage()))
      ),
    );
  }
}