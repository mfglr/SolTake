import 'package:flutter/material.dart';
import 'package:my_social_app/views/profile/pages/display_requests_page/display_requests_page.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:my_social_app/views/shared/language_widget.dart';
import 'display_requests_menu_item_contstants.dart';

class DisplayRequestsMenuItem extends StatelessWidget {
  const DisplayRequestsMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LanguageWidget(
      child: (language) => ProfileMenuItem(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DisplayRequestsPage())),
        name: content[language]!,
        icon: Icons.hourglass_bottom,
      )
    );
  }
}