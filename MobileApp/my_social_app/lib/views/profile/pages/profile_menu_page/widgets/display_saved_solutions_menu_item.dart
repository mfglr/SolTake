import 'package:flutter/material.dart';
import 'package:my_social_app/views/profile/pages/display_abstract_saved_solutions_page/display_abstract_saved_solutions_page.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplaySavedSolutionsMenuItem extends StatelessWidget {
  const DisplaySavedSolutionsMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileMenuItem(
      name: AppLocalizations.of(context)!.display_saved_solutions_menu_item_name,
      icon: Icons.border_color_outlined,
      onPressed: () => 
        Navigator
          .of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => const DisplayAbstractSavedSolutionsPage()
            )
          )
    );
  }
}