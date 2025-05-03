import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_social_app/views/profile/pages/display_balance_page/display_balance_page.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:my_social_app/views/shared/language_widget.dart';

import 'display_balance_menu_item_texts.dart' show content;

class DisplayBalanceMenuItem extends StatelessWidget {
  const DisplayBalanceMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (language) => ProfileMenuItem(
        icon: FontAwesomeIcons.coins,
        name: content[language]!,
        onPressed: () => 
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => const DisplayBalancePage())),
        iconColor: Colors.amber,
      ),
    );
  }
}