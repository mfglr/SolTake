import 'package:flutter/material.dart';
import 'package:my_social_app/views/profile/pages/display_blocked_users/display_block_users.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'dispaly_blocks_menu_item_texts.dart';

class DisplayBlocksMenuItem extends StatelessWidget {
  const DisplayBlocksMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (language) => ProfileMenuItem(
        name: content[language]!,
        icon: Icons.block,
        onPressed: () =>
          Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (context) => const DisplayBlockUsers())),
      ),
    );
  }
}