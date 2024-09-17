import 'package:flutter/material.dart';
import 'package:my_social_app/views/profile/pages/display_abstract_saved_questions_page/display_abstract_saved_questions_page.dart';
import 'package:my_social_app/views/profile/pages/profile_menu_page/widgets/profile_menu_item.dart';
import 'package:my_social_app/views/shared/app_back_button_widget.dart';
import 'package:my_social_app/views/shared/app_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileMenuPage extends StatelessWidget {
  const ProfileMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButtonWidget(),
        title: AppTitle(title: AppLocalizations.of(context)!.profile_menu_page_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ProfileMenuItem(
              name: AppLocalizations.of(context)!.profile_menu_page_saves_item,
              icon: Icons.bookmark,
              onPressed: () =>
                Navigator
                  .of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => const DisplayAbstractSavedQuestionsPage() 
                    )
                  ),
            )
          ],
        ),
      ),
    );
  }
}